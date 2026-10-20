pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import qs.config
import qs.modules.bar
import qs.modules.dock

PanelWindow {
    id: root

    required property var modelData
    property bool isDockHidden: true

    screen: modelData
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    IpcHandler {
        target: `dock-${root.screen.name}`
        function toggleVisibility(): void {
            root.isDockHidden = !root.isDockHidden;
        }
    }

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
                maskSource: maskItem
                maskEnabled: true
                maskInverted: true
                maskThresholdMin: 0.5
                maskSpreadAtMin: 1
                autoPaddingEnabled: false
            }
        }

        Item {
            id: maskItem

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
            shadowEnabled: Theme.frameShadowEnabled
            shadowBlur: Theme.frameShadowBlur
            shadowColor: Theme.frameShadowColor
            blurMultiplier: 1
        }

        Rectangle {
            id: dockBandLeft

            color: Theme.surface
            layer.enabled: true

            // to make sure the concave corner is drawn fully
            implicitWidth: Theme.dockRadius * 2

            anchors {
                top: dock.top
                bottom: dock.bottom
                right: dock.left
                bottomMargin: Theme.frameWidth
            }

            layer.effect: MultiEffect {
                maskSource: maskItemDockLeft
                maskEnabled: true
                maskInverted: true
                maskThresholdMin: 0.5
                maskSpreadAtMin: 1
                autoPaddingEnabled: false
            }

            Item {
                id: maskItemDockLeft

                anchors.fill: parent
                layer.enabled: true
                visible: false

                Rectangle {
                    bottomRightRadius: Theme.dockRadius
                    anchors.fill: parent
                }
            }
        }

        Rectangle {
            id: dockBandRight

            color: Theme.surface
            layer.enabled: true

            // to make sure the concave corner is drawn fully
            implicitWidth: Theme.dockRadius * 2

            anchors {
                top: dock.top
                bottom: dock.bottom
                left: dock.right
                bottomMargin: Theme.frameWidth
            }

            layer.effect: MultiEffect {
                maskSource: maskItemDockRight
                maskEnabled: true
                maskInverted: true
                maskThresholdMin: 0.5
                maskSpreadAtMin: 1
                autoPaddingEnabled: false
            }

            Item {
                id: maskItemDockRight

                anchors.fill: parent
                layer.enabled: true
                visible: false

                Rectangle {
                    bottomLeftRadius: Theme.dockRadius
                    anchors.fill: parent
                }
            }
        }

        Dock {
            id: dock

            anchors {
                bottom: parent.bottom
                bottomMargin: root.isDockHidden ? -dock.height : 0
                horizontalCenter: parent.horizontalCenter
            }

            Behavior on anchors.bottomMargin {
                NumberAnimation {
                    duration: Theme.dockAnimationDuration
                    easing.type: Easing.OutQuart
                }
            }
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

        Region {
            item: dock
        }
    }
}
