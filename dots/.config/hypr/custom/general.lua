local smw = require("plugins.split-monitor-workspaces")

hl.config ({
    general = {
        snap = {
            enabled = true,
            window_gap = 20,
            monitor_gap = 20,
            respect_gaps = true
        }
    },
    input = {
        -- flat acceleration
        accel_profile = "flat",
        -- Keyboard: Add a layout and uncomment kb_options for Win+Space switching shortcut
        kb_layout = "us", "ru",
        -- bind layout switch
        kb_options = "grp:win_space_toggle", -- FIXME
        -- hyprlanad binds still work on other layouts
        resolve_binds_by_sym = false,
        numlock_by_default = false,
        repeat_delay = 250,
        repeat_rate = 35,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.5
        },

        special_fallthrough = true,
        follow_mouse = 1
    },
    cursor = {
        inactive_timeout = 3
    },
    decoration = {
        rounding = 20
    },
    misc = {
        swallow_regex = ""
    },
    plugin = {
        
    },
    xwayland = {
        force_zero_scaling = true
    },
    debug = {
        disable_logs = true,
        enable_stdout_logs = true
    }
})

hl.device({
    name = "pnp0c50:00-04f3:31ff-touchpad",
    enabled = true
})

smw.setup({
    workspace_count = 5,
    keep_focused = 0,
    enable_notifications = 0,
    enable_persistent_workspaces = 1
})

hl.monitor({
    output = "DP-2",
    mode = "2560x1440@240",
    position = "0x0",
    scale = "1.25"
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "1920x1080@74.97300",
    position = "2048x0",
    scale = "1"
})