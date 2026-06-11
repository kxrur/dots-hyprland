

hl.on("hyprland.start", function ()
    -- exec-once = kanshi reload
    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 20")

    -- exec-once = hyprpm reload -n // FIXME
    -- exec-once=hyprctl plugin load /home/kxr/Desktop/git/split-monitor-workspaces/split-monitor-workspaces.so


    hl.exec_cmd("coolercontrol")
    hl.exec_cmd("steam")
    hl.exec_cmd("zen-browser")
end)
