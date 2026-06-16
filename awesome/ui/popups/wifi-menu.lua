local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local info = wibox.widget {
    text = "Loading...",
    widget = wibox.widget.textbox
}

local wifi_enabled = wibox.widget {
    text = "Wifi Enabled",
    widget = wibox.widget.textbox
}

local disconnect = wibox.widget {
    text = "Disconnect",
    widget = wibox.widget.textbox,
    border_width = 1,
}


wifi_enabled:buttons(gears.table.join(
    awful.button({}, 1, function()
        print("clicked")
    end)
))

disconnect:buttons(gears.table.join(
    awful.button({}, 1, function()
        print("clicked")
    end)
))




--(---------MENU--------)---

local menu = awful.popup {
    visible = false,
    ontop = true,

    border_width = 1,
    border_color = "#4C566A",
    --shape = gears.shape.rounded_rect,

    x = 1580,
    y = 25,

    minimum_width = 200,
    minimum_height = 100,

    widget = {
        {
            info,
            margins = 10,
            widget = wibox.container.margin
        },
        wifi_enabled,
        disconnect,
        layout = wibox.layout.fixed.vertical
    }
}

menu.info = info

return menu