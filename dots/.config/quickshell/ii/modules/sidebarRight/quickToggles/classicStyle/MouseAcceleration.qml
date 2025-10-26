import qs.modules.common
import qs.modules.common.widgets
import qs
import Quickshell
import Quickshell.Io

QuickToggleButton {
    id: root
    buttonIcon: "mouse"
    toggled: false

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
        content: Translation.tr("Mouse acceleration")
    }
}
