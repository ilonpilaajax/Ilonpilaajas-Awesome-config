local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local s = screen.primary

local menu = awful.popup {
    visible = false,
    ontop = true,

    placement = awful.placement.centered,
    shape = gears.shape.rounded_rect,

    border_width = 2,
    border_color = "#ffffff",

    minimum_width = 600,
    minimum_height = 400,

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