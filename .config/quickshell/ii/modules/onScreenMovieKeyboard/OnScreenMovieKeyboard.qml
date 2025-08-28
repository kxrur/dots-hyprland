import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Io
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

Scope { // Scope
    id: root
    property bool pinned: Config.options?.oskMovie?.pinnedOnStartup ?? false

    component MovieControlButton: GroupButton { // Control button
        baseWidth: 40
        baseHeight: 40
        clickedWidth: baseWidth
        clickedHeight: baseHeight + 20
        buttonRadius: Appearance.rounding.normal
    }

    Loader {
        id: movieOskLoader
        active: GlobalStates.oskMovieOpen
        onActiveChanged: {
            if (!movieOskLoader.active) {
                Ydotool.releaseAllKeys();
            }
        }
        
        sourceComponent: PanelWindow { // Window
            id: movieOskRoot
            visible: movieOskLoader.active && !GlobalStates.screenLocked

            anchors {
                top: true
                left: true
            }

            function hide() {
                movieOskLoader.active = false
            }
            exclusiveZone: root.pinned ? implicitHeight - Appearance.sizes.hyprlandGapsOut : 0
            implicitWidth: movieOskBackground.width + Appearance.sizes.elevationMargin * 2
            implicitHeight: movieOskBackground.height + Appearance.sizes.elevationMargin * 2
            WlrLayershell.namespace: "quickshell:oskMovie"
            WlrLayershell.layer: WlrLayer.Overlay
            // Hyprland 0.49: Focus is always exclusive and setting this breaks mouse focus grab
            // WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
            color: "transparent"

            mask: Region {
                item: movieOskBackground
            }

            // Background
            StyledRectangularShadow {
                target: movieOskBackground
            }
            Rectangle {
                id: movieOskBackground
                anchors.centerIn: parent
                color: Appearance.colors.colLayer0
                radius: Appearance.rounding.windowRounding
                property real padding: 10
                implicitWidth: movieOskRowLayout.implicitWidth + padding * 2
                implicitHeight: movieOskRowLayout.implicitHeight + padding * 2

                Keys.onPressed: (event) => { // Esc to close
                    if (event.key === Qt.Key_Escape) {
                        movieOskRoot.hide()
                    }
                }

                RowLayout {
                    id: movieOskRowLayout
                    anchors.centerIn: parent
                    spacing: 5
                    
                    MovieKeyboardContent {
                        id: movieOskContent
                        Layout.fillWidth: true
                    }
                }
            }

        }
    }

    IpcHandler {
        target: "oskMovie"

        function toggle(): void {
            GlobalStates.oskMovieOpen = !GlobalStates.oskMovieOpen;
        }

        function close(): void {
            GlobalStates.oskMovieOpen = false
        }

        function open(): void {
            GlobalStates.oskMovieOpen = true
        }
    }

    GlobalShortcut {
        name: "oskMovieToggle"
        description: "Toggles movie on screen keyboard on press"

        onPressed: {
            GlobalStates.oskMovieOpen = !GlobalStates.oskMovieOpen;
        }
    }

    GlobalShortcut {
        name: "oskMovieOpen"
        description: "Opens movie on screen keyboard on press"

        onPressed: {
            GlobalStates.oskMovieOpen = true
        }
    }

    GlobalShortcut {
        name: "oskMovieClose"
        description: "Closes movie on screen keyboard on press"

        onPressed: {
            GlobalStates.oskMovieOpen = false
        }
    }

}
