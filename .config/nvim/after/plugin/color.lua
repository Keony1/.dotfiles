-- local statusline = require('feline');
local statusline = require('lualine');

statusline.setup({
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        }
    }
})

function ColorMyPencils(color)
    -- onedark
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


ColorMyPencils()
