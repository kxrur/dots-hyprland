import QtQuick
import Quickshell
import qs.services
import qs.modules.common

QuickToggleModel {
    id: root

    readonly property string monitorName: "HDMI-A-2"
    readonly property string enableCommand: 'hl.monitor({ output = "HDMI-A-2", disabled = false, mode = "1920x1080@74.97300", position = "2048x0", scale = 1 })'
    readonly property string disableCommand: 'hl.monitor({ output = "HDMI-A-2", disabled = true })'

    name: Translation.tr("HDMI display")
    statusText: toggled ? Translation.tr("On") : Translation.tr("Off")
    tooltipText: Translation.tr("HDMI display | Toggle the 1080p monitor")
    icon: toggled ? "desktop_windows" : "desktop_access_disabled"
    toggled: HyprlandData.monitors.some(monitor => monitor.name === root.monitorName)

    mainAction: () => {
        Quickshell.execDetached(["hyprctl", "eval", root.toggled ? root.disableCommand : root.enableCommand]);
        monitorRefreshTimer.restart();
    }

    Timer {
        id: monitorRefreshTimer
        interval: 250
        onTriggered: HyprlandData.updateMonitors()
    }
}
