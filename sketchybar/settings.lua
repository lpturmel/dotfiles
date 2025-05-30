local padding <const> = {
    background = 8,
    icon = 10,
    label = 8,
    bar = 10,
    left = 12,
    right = 12,
    item = 18,
    popup = 8,
}

local graphics <const> = {
    bar = {
        height = 36,
        offset = 10,
    },
    background = {
        height = 24,
        corner_radius = 9,
    },
    slider = {
        height = 20,
    },
    popup = {
        width = 200,
        large_width = 300,
    },
    blur_radius = 30,
}

local fonts = {
    text = "SpaceMono Nerd Font",
    numbers = "SpaceMono Nerd Font",
    icons = function(size)
        local font = "sketchybar-app-font:Regular"
        return size and font .. ":" .. size or font .. ":" .. dimens.text.icon
    end,
    styles = {
        regular = "Regular",
        bold = "Bold",
    }
}


local text <const> = {
    icon = 16.0,
    label = 14.0,
}

local dimens = {
    padding = padding,
    graphics = graphics,
    text = text,
}
return {
    paddings = 3,
    dimens = dimens,
    fonts = fonts,
}
