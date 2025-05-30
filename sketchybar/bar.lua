local colors = require("colors")
local settings = require("settings")

-- Equivalent to the --bar domain
sbar.bar({
    height = settings.dimens.graphics.bar.height,
    color = colors.bar.bg,
    padding_right = settings.dimens.padding.right,
    padding = settings.dimens.padding.bar,
    padding_left = settings.dimens.padding.left,
    margin = settings.dimens.padding.bar,
    corner_radius = settings.dimens.graphics.background.corner_radius,
    y_offset = settings.dimens.graphics.bar.offset,
    topmost = "window",
    border_width = 0
})
