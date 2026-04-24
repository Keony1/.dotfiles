local sftp_cache = {}
local sftp_root_cache = {}
local sftp_failed = {}
local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_idx = 1
local spinner_timer = nil

_G.sftp_enabled = true
_G.sftp_uploading = 0

local function start_spinner()
  if spinner_timer then return end
  spinner_timer = vim.uv.new_timer()
  spinner_timer:start(0, 100, vim.schedule_wrap(function()
    spinner_idx = (spinner_idx % #spinner_frames) + 1
    vim.cmd("redrawstatus")
  end))
end

local function stop_spinner()
  if spinner_timer then
    spinner_timer:stop()
    spinner_timer:close()
    spinner_timer = nil
  end
  vim.cmd("redrawstatus")
end

local function find_sftp_config(file)
  if not file or file == "" or not vim.startswith(file, "/") then return end

  local start_dir = vim.fn.fnamemodify(file, ":h")
  if sftp_root_cache[start_dir] ~= nil then
    local cached = sftp_root_cache[start_dir]
    if cached == false then return nil end
    return cached, cached .. "/.vscode/sftp.json"
  end

  local dir = start_dir
  while dir ~= "/" do
    local config_path = dir .. "/.vscode/sftp.json"
    if vim.fn.filereadable(config_path) == 1 then
      sftp_root_cache[start_dir] = dir
      return dir, config_path
    end
    local parent = vim.fn.fnamemodify(dir, ":h")
    if parent == dir then break end
    dir = parent
  end

  sftp_root_cache[start_dir] = false
end

local function load_sftp_config(config_path)
  if sftp_cache[config_path] then return sftp_cache[config_path] end
  local ok, data = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(config_path), "\n"))
  if not ok then return nil end
  sftp_cache[config_path] = data
  return data
end

local function is_ignored(rel, ignores)
  for _, pattern in ipairs(ignores or {}) do
    local lua_pat = "^" .. pattern:gsub("([%.%+%[%]%(%)%$%^])", "%%%1"):gsub("%*%*", ".+"):gsub("%*", "[^/]+")
    if rel:match(lua_pat) then return true end
  end
  return false
end

local function sftp_upload(file, force)
  if not force and not _G.sftp_enabled then return end

  file = vim.fn.fnamemodify(file, ":p")
  local root, config_path = find_sftp_config(file)
  if not root then return end

  local cfg = load_sftp_config(config_path)
  if not cfg or not cfg.host or not cfg.remotePath then return end

  local rel = file:sub(#root + 2)
  if is_ignored(rel, cfg.ignore) then return end

  _G.sftp_uploading = _G.sftp_uploading + 1
  start_spinner()

  local remote = cfg.host .. ":" .. cfg.remotePath .. rel
  vim.fn.jobstart({ "scp", file, remote }, {
    on_exit = function(_, code)
      vim.schedule(function()
        _G.sftp_uploading = math.max(0, _G.sftp_uploading - 1)
        if _G.sftp_uploading == 0 then stop_spinner() end
        if code == 0 then
          -- remove from failed list if it was there
          for i, entry in ipairs(sftp_failed) do
            if entry.filename == file then
              table.remove(sftp_failed, i)
              break
            end
          end
          vim.notify("Uploaded: " .. rel, vim.log.levels.INFO)
        else
          table.insert(sftp_failed, {
            filename = file,
            lnum = 1,
            text = os.date("%H:%M:%S") .. " Upload failed: " .. rel,
          })
          vim.notify("Upload failed: " .. rel .. " — <leader>sl to view log", vim.log.levels.ERROR)
        end
      end)
    end,
  })
end

function SftpStatusline()
  local file = vim.fn.expand("%:p")
  if not vim.startswith(file, "/") then return "" end
  if not find_sftp_config(file) then return "" end
  if not _G.sftp_enabled then return "󰅧 SFTP off" end
  if _G.sftp_uploading > 0 then return "󰅧 " .. spinner_frames[spinner_idx] end
  return "󰅧 SFTP"
end

-- toggle upload
vim.keymap.set("n", "<leader>su", function()
  _G.sftp_enabled = not _G.sftp_enabled
  vim.notify("SFTP upload " .. (_G.sftp_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
end, { desc = "Toggle SFTP upload" })

-- manually upload current file (bypasses toggle)
vim.keymap.set("n", "<leader>sU", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file to upload", vim.log.levels.WARN)
    return
  end
  sftp_upload(file, true)
end, { desc = "Force upload current file via SFTP" })

-- show failed uploads in quickfix
vim.keymap.set("n", "<leader>sl", function()
  if #sftp_failed == 0 then
    vim.notify("No failed uploads", vim.log.levels.INFO)
    return
  end
  vim.fn.setqflist(sftp_failed, "r")
  vim.cmd("copen")
end, { desc = "Show SFTP upload failure log" })

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(ev)
    sftp_upload(ev.file)
  end,
})
