import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.common.functions
import QtQuick
import QtQuick.Layouts

RippleButton {
    id: root
    property var keyData
    property string key: keyData.label
    property string type: keyData.keytype
    property var keycode: keyData.keycode
    property string shape: keyData.shape
    property bool isLeftArrow: keycode === 105
    property bool isRightArrow: keycode === 106
    property var altKeycode: isLeftArrow ? 36 : isRightArrow ? 38 : keycode  // j=36, l=38
    property real baseWidth: 60
    property real baseHeight: 60
    property var widthMultiplier: ({
        "normal": 1,
        "space": 1.8,
        "expand": 1.5
    })
    property var heightMultiplier: ({
        "normal": 1,
        "space": 1
    })

    enabled: shape != "empty"
    buttonRadius: Appearance.rounding.small
    implicitWidth: baseWidth * (widthMultiplier[shape] || 1)
    implicitHeight: baseHeight * (heightMultiplier[shape] || 1)
    Layout.fillWidth: shape == "space" || shape == "expand"

    downAction: () => {
        Ydotool.press(root.keycode);
    }
    
    releaseAction: () => {
        Ydotool.release(root.keycode);
    }
    
    altAction: () => {
        if (root.isLeftArrow || root.isRightArrow) {
            Ydotool.press(root.altKeycode);
            Ydotool.release(root.altKeycode);
        }
    }

    contentItem: StyledText {
        id: keyText
        anchors.fill: parent
        font.pixelSize: Appearance.font.pixelSize.huge
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Appearance.colors.colOnLayer1
        text: root.keyData.label
    }
}
