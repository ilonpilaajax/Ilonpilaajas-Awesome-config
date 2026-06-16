local awful = require("awful")
local wibox = require("wibox")

local battery = wibox.widget.textbox()

awful.widget.watch(
    "bash -c \"cat /sys/class/power_supply/BAT0/capacity 2>/dev/null\"",
    30,
    function(_, stdout)
        local level = tonumber(stdout) or 0
        local battery_indicator = get_battery_indicator(level)
	battery:set_text("|   " .. battery_indicator .. ">  "  .. level .. "%  |")
	end,

    battery
)

function get_battery_indicator(level)
	local battery_text = ""
	local states = {15,35,50,80,90}
	for i, v in ipairs(states) do
		if level > v then
			battery_text = battery_text .. "█"
		else
			battery_text = battery_text .. "░"
		end
	end
	return battery_text
	

end

return battery
