local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local menu = require("ui.popups.wifi-menu")


local wifi = wibox.widget {
    text = "WiFi: ?",
    widget = wibox.widget.textbox
}


local function update()
    awful.spawn.easy_async_with_shell(
        "nmcli -t -f active,ssid,signal dev wifi 2>/dev/null | grep '^yes:'",
        function(out)
            out = (out or ""):gsub("\n", "")

            local ssid, signal = out:match("yes:([^:]*):(%d+)")

            if not ssid or ssid == "" then
                wifi.text = "WiFi: OFF"
                menu.info.text = "Not connected"
            else
                wifi.text = "|   WiFi: " .. " (" .. signal .. "%)   "
                menu.info.text = "SSID: " .. ssid .. "\nSignal: " .. signal .. "%"
            end
        end
    )
end

-- SAFE click handler
wifi:buttons(gears.table.join(
    awful.button({}, 1, function()
        if menu.visible then
            menu.visible = false
        else
            menu.visible = true
            update()
        end
    end)
))


-- timer
gears.timer {
    timeout = 15,
    autostart = true,
    call_now = true,
    callback = update
}

update()

return wifi