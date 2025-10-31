import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import Quickshell
import Quickshell.Io

AndroidQuickToggleButton {
    id: root
    
    name: Translation.tr("Mouse acceleration")
    toggled: false
    buttonIcon: "mouse"
    
    onClicked: {
        root.toggled = !root.toggled
        if (root.toggled) {
            // Enable acceleration (adaptive profile)
            Quickshell.execDetached(["hyprctl", "keyword", "input:accel_profile", "adaptive"])
        } else {
            // Disable acceleration (flat profile)
            Quickshell.execDetached(["hyprctl", "keyword", "input:accel_profile", "flat"])
        }
    }

    Process {
        id: fetchActiveState
        running: true
        command: ["bash", "-c", `test "$(hyprctl getoption input:accel_profile -j | jq -r '.str')" = "adaptive"`]
        onExited: (exitCode, exitStatus) => {
            root.toggled = exitCode === 0 // Exit code 0 means adaptive is enabled
        }
    }

    StyledToolTip {
        text: Translation.tr("Toggle mouse acceleration")
    }
}
