local awful = require("awful")
local wibox = require("wibox")

local clock = wibox.widget.textclock(" %H:%M ")

local widget = wibox.widget {
    {
        widget = wibox.widget.textbox,
        text = "| ⏲ ",
    },
    clock,
    {
        widget = wibox.widget.textbox,
        text = "   ",
    },
    layout = wibox.layout.fixed.horizontal,
}

return widget