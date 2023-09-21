return {
    'kyazdani42/nvim-web-devicons',
    config = function()
        local wdev_icons = require("nvim-web-devicons")
        wdev_icons.setup {
         override = {
         };
         default = true;
        }
    end
}
