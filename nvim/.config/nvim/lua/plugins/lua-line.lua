return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "nightfly",
                globalstatus = true,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", { SftpStatusline, color = function()
                    if not _G.sftp_enabled then return { fg = "#f97316" } end
                    if _G.sftp_uploading and _G.sftp_uploading > 0 then return { fg = "#38bdf8" } end
                    return { fg = "#84cc16" }
                end } },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_lsp", "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
                    },
                    {
                        function()
                            local clients = vim.lsp.get_clients({ bufnr = 0 })
                            if #clients == 0 then return "" end
                            local names = {}
                            for _, c in ipairs(clients) do
                                table.insert(names, c.name)
                            end
                            return " " .. table.concat(names, ", ")
                        end,
                    },
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
