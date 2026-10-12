import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import qs.config

PanelWindow {
    id: root

    required property var modelData

    screen: modelData
    color: "transparent"
    visible: true
    WlrLayershell.layer: WlrLayer.Top
    exclusionMode: ExclusionMode.Ignore

    anchors {
        top: true
        left: true
        bottom: true
        right: true
    }

    Item {
        id: container

        anchors.fill: parent
        layer.enabled: true

        Rectangle {
            anchors.fill: parent
            color: Theme.surface
            layer.enabled: true

            layer.effect: MultiEffect {
                maskSource: mask
                maskEnabled: true
                maskInverted: true
                maskThresholdMin: 0.5
                maskSpreadAtMin: 1
                autoPaddingEnabled: false
            }

            Behavior on opacity {
                enabled: true

                NumberAnimation {
                    duration: 150
                }
            }
        }

        Item {
            id: mask

            anchors.fill: parent
            layer.enabled: true
            visible: false

            Rectangle {
                radius: Theme.screenCornerRadius
                anchors.fill: parent
                anchors.topMargin: Theme.barHeight + Theme.gothTop
                anchors.bottomMargin: Theme.frameWidth + Theme.gothBottom
                anchors.leftMargin: Theme.frameWidth + Theme.gothLeft
                anchors.rightMargin: Theme.frameWidth + Theme.gothRight
            }
        }

        layer.effect: MultiEffect {
            shadowEnabled: Theme.enableFrameShadow
            shadowOpacity: Theme.frameShadowOpacity
            shadowBlur: Theme.frameShadowBlur
            shadowColor: Qt.alpha(Theme.shadowColor, 1)
            blurMultiplier: 1
        }
    }

    Bar {
        id: bar

        screenName: root.screen.name

        anchors {
            // will later on add logic so the "bar" can be at the top, bottom, left or right heh
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    mask: Region {
        item: bar
    }
}
