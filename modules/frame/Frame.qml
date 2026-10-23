pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.config
import qs.modules.bar
import qs.modules.dock

PanelWindow {
    id: root
    WlrLayershell.namespace: `lily-frame-${root.screen.name}`
    BackgroundEffect.blurRegion: Region {
        item: innerContainer

        Region {
            item: maskItemSquare
            intersection: Intersection.Subtract
            radius: Theme.screenCornerRadius
            bottomLeftRadius: (Theme.frameWidth === 0) ? 0 : Theme.screenCornerRadius
            bottomRightRadius: (Theme.frameWidth === 0) ? 0 : Theme.screenCornerRadius
        }

        Region {
            item: dock
            intersection: Intersection.Combine
            topLeftRadius: Theme.dockRadius
            topRightRadius: Theme.dockRadius
        }

        Region {
            item: dockBandLeft
            intersection: Intersection.Combine

            Region {
                item: maskItemDockLeft
                intersection: Intersection.Subtract
                bottomRightRadius: Theme.dockRadius
            }
        }

        Region {
            item: dockBandRight
            intersection: Intersection.Combine

            Region {
                item: maskItemDockRight
                intersection: Intersection.Subtract
                bottomLeftRadius: Theme.dockRadius
            }
        }
    }

    required property var modelData
    property bool isDockHidden: true

    screen: modelData
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    Timer {
        id: dockShowTimer
        interval: Theme.dockShowDelay
        onTriggered: {
            if (dockHoverHandler.hovered)
                root.isDockHidden = false;
        }
    }

    Timer {
        id: dockHideTimer
        interval: Theme.dockHideDelay
        onTriggered: {
            if (!dockHoverHandler.hovered)
                root.isDockHidden = true;
        }
    }

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

        layer.effect: MultiEffect {
            shadowEnabled: Theme.frameShadowEnabled
            shadowBlur: Theme.frameShadowBlur
            shadowColor: Theme.frameShadowColor
            blurMultiplier: 1
        }

        Item {
            id: innerContainer

            opacity: Theme.surfaceOpacity
            layer.enabled: true

            anchors.fill: parent

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
                    id: maskItemSquare

                    radius: Theme.screenCornerRadius
                    bottomLeftRadius: (Theme.frameWidth === 0) ? 0 : Theme.screenCornerRadius
                    bottomRightRadius: (Theme.frameWidth === 0) ? 0 : Theme.screenCornerRadius
                    anchors.fill: parent
                    anchors.topMargin: Theme.barHeight + Theme.gothTop
                    anchors.bottomMargin: Theme.frameWidth + Theme.gothBottom
                    anchors.leftMargin: Theme.frameWidth + Theme.gothLeft
                    anchors.rightMargin: Theme.frameWidth + Theme.gothRight
                }
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

            Item {
                id: dockHoverZone

                implicitWidth: dock.width
                implicitHeight: (root.isDockHidden ? Theme.dockHoverZoneHeight : dock.height) + Theme.frameWidth

                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }

                HoverHandler {
                    id: dockHoverHandler

                    onHoveredChanged: {
                        if (root.isDockHidden)
                            dockShowTimer.restart();
                        else
                            dockHideTimer.restart();
                    }
                }
            }

            Dock {
                id: dock

                anchors {
                    bottom: parent.bottom
                    bottomMargin: root.isDockHidden ? -dock.height : Theme.frameWidth
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

        Region {
            item: dockHoverZone
        }
    }
}
