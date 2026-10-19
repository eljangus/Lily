pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import Quickshell
import qs.config
import qs.modules.bar
import qs.modules.dock

PanelWindow {
    id: root

    required property var modelData

    screen: modelData
    color: "transparent"
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

            visible: false // only temporary to hide while I'm working on it

            color: Theme.surface
            layer.enabled: true

            anchors {
                top: dock.top
                bottom: dock.bottom
                right: dock.left
                left: container.left
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
                    anchors.bottomMargin: Theme.frameWidth
                }
            }
        }

        Rectangle {
            id: dockBandRight

            visible: false // only temporary to hide while I'm working on it

            color: Theme.surface
            layer.enabled: true

            anchors {
                top: dock.top
                bottom: dock.bottom
                right: container.right
                left: dock.right
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
                    anchors.bottomMargin: Theme.frameWidth
                }
            }
        }

        Dock {
            id: dock

            visible: false // only temporary to hide while I'm working on it

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
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
