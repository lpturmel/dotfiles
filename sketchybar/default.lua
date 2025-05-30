-- local settings = require("settings")
-- local colors = require("colors")
--
-- -- Equivalent to the --default domain
-- sbar.default({
--     updates = "when_shown",
--     icon = {
--         font = {
--             family = settings.font,
--             style = "Bold",
--             size = 14.0
--         },
--         color = colors.white,
--         padding_left = settings.paddings,
--         padding_right = settings.paddings,
--     },
--     label = {
--         font = {
--             family = settings.font,
--             style = "Semibold",
--             size = 13.0
--         },
--         color = colors.white,
--         padding_left = settings.paddings,
--         padding_right = settings.paddings,
--     },
--     background = {
--         height = 26,
--         corner_radius = 9,
--         border_width = 2,
--     },
--     popup = {
--         background = {
--             border_width = 2,
--             corner_radius = 9,
--             border_color = colors.popup.border,
--             color = colors.popup.bg,
--             shadow = { drawing = true },
--         },
--         blur_radius = 20,
--     },
--     padding_left = 5,
--     padding_right = 5
-- })
local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

sbar.default({
    updates = "when_shown",
    icon = {
        font = {
            family = settings.fonts.text,
            style = settings.fonts.styles.regular,
            size = settings.dimens.text.icon,
        },
        color = colors.white,
        padding_left = settings.dimens.padding.icon,
        padding_right = settings.dimens.padding.icon,
    },
    label = {
        font = {
            family = settings.fonts.text,
            style = settings.fonts.styles.regular,
            size = settings.dimens.text.label,
        },
        color = colors.white,
        padding_left = settings.dimens.padding.label,
        padding_right = settings.dimens.padding.label,
    },
    background = {
        height = settings.dimens.graphics.background.height,
        corner_radius = settings.dimens.graphics.background.corner_radius,
        border_width = 0,
        image = {
            corner_radius = settings.dimens.graphics.background.corner_radius
        }
    },
    popup = {
        y_offset = settings.dimens.padding.popup,
        align = "center",
        background = {
            border_width = 0,
            corner_radius = settings.dimens.graphics.background.corner_radius,
            color = colors.popup.bg,
            shadow = { drawing = true },
            padding_left = settings.dimens.padding.icon,
            padding_right = settings.dimens.padding.icon,
        },
        blur_radius = settings.dimens.graphics.blur_radius,
    },
    slider = {
        highlight_color = colors.orange,
        background = {
            height = settings.dimens.graphics.slider.height,
            corner_radius = settings.dimens.graphics.background.corner_radius,
            color = colors.slider.bg,
            border_color = colors.slider.border,
            border_width = 1,
        },
        knob = {
            font = {
                family = settings.fonts.text,
                style = settings.fonts.styles.regular,
                size = 32,
            },
            string = icons.text.slider.knob,
            drawing = false,
        },
    },
    scroll_texts = true,
})
