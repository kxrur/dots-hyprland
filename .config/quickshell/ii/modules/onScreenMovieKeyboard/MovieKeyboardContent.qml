import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import "movieLayouts.js" as MovieLayouts
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland

Item {
    id: root    
    property var layouts: MovieLayouts.byName
    property var activeLayoutName: MovieLayouts.defaultLayout
    property var currentLayout: layouts[activeLayoutName]

    implicitWidth: keyRows.implicitWidth
    implicitHeight: keyRows.implicitHeight

    ColumnLayout {
        id: keyRows
        anchors.fill: parent
        spacing: 5

        Repeater {
            model: root.currentLayout.keys

            delegate: RowLayout {
                id: keyRow
                required property var modelData
                spacing: 5
                
                Repeater {
                    model: modelData
                    delegate: MovieKey { 
                        required property var modelData
                        keyData: modelData
                    }
                }
            }
        }
    }
}
