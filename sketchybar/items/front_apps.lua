local constants = require("constants")
local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local frontApps = {}

sbar.add("bracket", constants.items.FRONT_APPS, {}, { position = "left" })

local frontAppWatcher = sbar.add("item", {
    drawing = false,
    updates = true,
})

local function selectFocusedWindow(frontAppName)
    for appName, app in pairs(frontApps) do
        local isSelected = appName == frontAppName
        local color = isSelected and colors.orange or colors.white
        app:set(
            {
                label = { color = color },
                icon = { color = color },
            }
        )
    end
end

local function updateWindows(windows)
    sbar.remove("/" .. constants.items.FRONT_APPS .. "\\.*/")

    frontApps = {}
    local foundWindows = string.gmatch(windows, "[^\n]+")
    for window in foundWindows do
        local parsedWindow = {}
        for key, value in string.gmatch(window, "(%w+)=([%w%s]+)") do
            parsedWindow[key] = value
        end

        local windowId = parsedWindow["id"]
        local windowName = parsedWindow["name"]
        local icon = icons.apps[windowName] or icons.apps["default"]

        frontApps[windowName] = sbar.add("item", constants.items.FRONT_APPS .. "." .. windowName, {
            label = {
                padding_left = 0,
                string = windowName,
            },
            icon = {
                string = icon,
                font = settings.fonts.icons(),
            },
            click_script = "aerospace focus --window-id " .. windowId,
        })

        frontApps[windowName]:subscribe(constants.events.FRONT_APP_SWITCHED, function(env)
            selectFocusedWindow(env.INFO)
        end)
    end

    sbar.exec(constants.aerospace.GET_CURRENT_WINDOW, function(frontAppName)
        selectFocusedWindow(frontAppName:gsub("[\n\r]", ""))
    end)
end

local function getWindows()
    sbar.exec(constants.aerospace.LIST_WINDOWS, updateWindows)
end

frontAppWatcher:subscribe(constants.events.UPDATE_WINDOWS, function()
    getWindows()
end)

getWindows()
