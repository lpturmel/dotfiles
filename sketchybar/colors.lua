return {
    black = 0xff1d2428,
    white = 0xfff8f9e8,
    red = 0xfff57f82,
    green = 0xffcae0a7,
    blue = 0xffb2cfed,
    yellow = 0xfff5d098,
    orange = 0xfff5d098,
    magenta = 0xfff3c0e5,
    grey = 0xff2d393d,
    transparent = 0x00000000,
    dirty_white = 0xc8f8f9e8,
    bar = {
        bg = 0xE61d2428,
        border = 0xff2d393d,
    },
    popup = {
        bg = 0xff1d2428,
        border = 0xff96b4aa
    },
    slider = {
        bg = 0xf11d2428,
        border = 0xff2d393d,
    },
    bg1 = 0x802d393d,
    bg2 = 0xff2d393d,
    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then return color end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
