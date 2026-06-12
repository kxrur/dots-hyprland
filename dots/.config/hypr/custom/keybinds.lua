hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
    { description = "Edit user keybinds" })

require("hyprland.lib")
require("hyprland.variables")
local smw = require("plugins.split-monitor-workspaces")

-- ------------------------- UNBIND -------------------------

hl.unbind("SUPER + O")
hl.unbind("SUPER + Z")
hl.unbind("SUPER + Q")
hl.unbind("SUPER + D")
hl.unbind("SUPER + T")
hl.unbind("SUPER + Return")

hl.unbind("SUPER + Tab")
hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")

hl.unbind("SUPER + L")
hl.unbind("SUPER + SHIFT + L")
hl.unbind("SUPER + K")

-- super+alt ???
for i = 10, 19 do
    hl.unbind("SUPER + ALT + code:" .. i)
end

for _, code in ipairs({ 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }) do
    hl.unbind("SUPER + ALT + code:" .. code)
end

for i = 10, 19 do
    hl.unbind("SUPER + code:" .. i)
end

for _, code in ipairs({ 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }) do
    hl.unbind("SUPER + code:" .. code)
end

hl.unbind("SUPER + T")
hl.unbind("SUPER + Return")

hl.unbind("SUPER + Q")
hl.unbind("SUPER + D")

hl.unbind("SUPER + Control + S")

hl.unbind("SUPER + O")

-- remove volume bind - DSNT WORK
-- (kept as comment intentionally)
-- hl.unbind("XF86AudioRaiseVolume")
-- hl.unbind("XF86AudioLowerVolume")

hl.unbind("SUPER + Z")

hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")

hl.unbind("SUPER + Tab")

hl.unbind("SUPER + ALT + F")

hl.unbind("Ctrl + Alt + T")

hl.unbind("SUPER + SHIFT + mouse_down")
hl.unbind("SUPER + SHIFT + mouse_up")
hl.unbind("SUPER + ALT + mouse_down")
hl.unbind("SUPER + ALT + mouse_up")

hl.unbind("CTRL + SUPER + Left")
hl.unbind("CTRL + SUPER + Reft")

hl.unbind("SUPER + SUPER_L")
hl.unbind("SUPER + SUPER_R")


for i = 1, 10 do
    hl.unbind("SUPER + " .. (i % 10))
    hl.unbind("SUPER + SHIFT +" .. (i % 10))
end

-- ------------------------- BIND -------------------------

-- Screenshot area
hl.bind("SUPER + CONTROL + S",
    hl.dsp.exec_cmd(
        "mkdir -p ~/Pictures/Screenshots && ~/.config/ags/scripts/grimblast.sh --freeze copysave area ~/Pictures/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png"),
    { description = "Screenshot area" })

-- App launcher
hl.bind("SUPER + D",
    hl.dsp.exec_cmd("pkill anyrun || anyrun"),
    { description = "App launcher" })

-- Exit fullscreen
hl.bind("SUPER + SHIFT + D",
    hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
    { description = "Exit fullscreen" })

-- Quit window
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close(),
    { description = "Quit window" })

-- Terminal
hl.bind("SUPER + Return",
    hl.dsp.exec_cmd("kitty"),
    { description = "Terminal" })

-- Lock / suspend
hl.bind("SUPER + SHIFT + U",
    hl.dsp.exec_cmd("loginctl lock-session"),
    { description = "Lock screen" })

hl.bind("SUPER + CONTROL + SHIFT + U",
    hl.dsp.exec_cmd("loginctl lock-session"),
    { description = "Lock screen (alt)" })

hl.bind("SUPER + SHIFT + U",
    hl.dsp.exec_cmd("sleep 0.1 && systemctl suspend || loginctl suspend"),
    { locked = true, description = "Suspend" })


hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

-- Move window to workspace Super + Shift + [0-9]
hl.bind("CTRL + SHIFT + S",
    hl.dsp.window.move({ workspace = "special" }),
    { description = "Move to special workspace" })


hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })

hl.bind("SUPER + SHIFT + O", hl.dsp.layout("togglesplit"))


-- #/# bind = Super+Alt, Hash,, # Send to workspace # (1, 2, 3,...)

-- Switch workspaces with mainMod + [0-5]
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    -- Switch to the Nth workspace on the currently focused monitor.
    hl.bind("SUPER" .. " +" .. n, smw.workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor silently (no focus change).
    hl.bind("SUPER" .. " + SHIFT +" .. n, smw.move_to_workspace_silent(n))
end


hl.bind("SUPER" .. " + mouse_up", smw.cycle_workspaces("next"))
hl.bind("SUPER" .. " + mouse_down", smw.cycle_workspaces("prev"))

-- rotate monitor
hl.bind("code:157",
    hl.dsp.exec_cmd("~/.config/ags/scripts/hyprland/toggle_monitor_transform.sh"),
    { description = "Rotate monitor" })

-- Fullscreen fake
hl.bind("SUPER + ALT + F",
    hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }),
    { description = "Fake fullscreen" })

-- Toggle overview (kept structure reference)
hl.bind("SUPER + D",
    hl.dsp.global("quickshell:searchToggle"),
    { description = "Toggle launcher (alt)" })

-- submap (virtual box)
hl.bind("SUPER + Delete", hl.dsp.submap("clean"))

hl.define_submap("clean", function()
    hl.bind("SUPER + Home", function()
        hl.dispatch(hl.dsp.submap("global"))
    end, { submap_universal = true })
end)


hl.bind("SUPER + SHIFT + mouse:276", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + SHIFT + mouse:275", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER + SHIFT + mouse:274", hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind("SUPER + SHIFT + mouse_down",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"))

hl.bind("SUPER + SHIFT + mouse_up",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"))

hl.bind("SUPER + Z", hl.dsp.window.drag(), { mouse = true })
