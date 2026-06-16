local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local menu = require("ui.menus.settings-menu")

local mybutton = wibox.widget {
    {
        text = "⚙",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox,
    },
    forced_width = 20,
    forced_height = 20,
    bg = "#000000",
    widget = wibox.container.background,
}

mybutton:buttons(
    gears.table.join(
        awful.button({}, 1, function()
            menu.visible = not menu.visible
        end)
    )
)

return mybutton



