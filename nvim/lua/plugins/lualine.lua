return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
        local lualine = require("lualine")                                              
        lualine.setup {
          options = {
            theme = "catppuccin"
          }
        }
    end
}
