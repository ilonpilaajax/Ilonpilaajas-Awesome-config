local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local menu = awful.popup {
    visible = false,
    ontop = true,
    placement = awful.placement.centered,
    shape = gears.shape.rounded_rect,
    widget = {
        {
            text = "Hello",
            widget = wibox.widget.textbox
        },
        margins = 20,
        widget = wibox.container.margin,
    },
}

return menu