local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local menu = require("ui.popups.volume_controller")

local volume_widget = wibox.widget.textbox()

awful.widget.watch(
    "pamixer --get-volume-human",
    2,
    function(widget, stdout)
        volume_widget:set_text("   🔊 " .. stdout .. "   |   ")
    end,
    volume_widget
)

local mybutton = wibox.widget {
    {
        text = volume_widget.text,
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


return volume_widget