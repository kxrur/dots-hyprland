require("hyprland.lib")
require("hyprland.variables")

hl.window_rule({
    name = "steam",
    match = { title = "Steam" },
    workspace = "1 silent",
})

hl.window_rule({
    name = "heroic",
    match = { class = "heroic" },
    workspace = "9 silent",
    fullscreen_state = "0 0",
})

-- window_rule {
--   name = workspace
--   match:class = steam
--   # doesn't work atm
--   match:title = negative:Steam
--
--   workspace = 1
--   float = on
-- }

hl.window_rule({
    name = "fake_fullscreen",
    match = {
        class = "zen|code|krita|tv.anilibria.AniLibria",
    },
    fullscreen_state = "0 2",
})

hl.window_rule({
    name = "games",
    match = {
        class = "steam_app.*|cs2|momentum",
    },
    immediate = true,
    workspace = "2 silent",
    fullscreen_state = "3 3",
    -- doens't work atm
    -- no_initial_focus = on
})

hl.window_rule({
    name = "dev",
    match = {
        class = "App|tinywell|battery_test_gui",
    },
    workspace = "special silent",
})

hl.window_rule({
    name = "cooler",
    match = {
        class = "org.coolercontrol.CoolerControl",
    },
    workspace = "8 silent",
})


local hostname = io.popen("hostname"):read("*l")

if not (hostname and hostname:find("lap", 1, true)) then
    hl.window_rule({
        name = "browser",
        match = {
            class = "zen",
        },
        workspace = "7 silent",
    })
end

hl.window_rule({
    name = "emulator",
    match = {
        class = "Emulator|scrcpy",
    },
    workspace = "special silent",
    float = true,
})

hl.window_rule({
    name = "ff14",
    match = {
        initial_title = "FFXIVLauncher",
    },
    workspace = "2 silent",
    fullscreen_state = "0 0",
    float = true, -- was "one" (invalid in original config)
})
