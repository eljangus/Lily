pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import qs.config

Item {
    id: root

    implicitHeight: dock.implicitHeight
    implicitWidth: dock.implicitWidth

    ClippingRectangle {
        id: dock
        color: Theme.surface

        topRightRadius: Theme.dockRadius
        topLeftRadius: Theme.dockRadius

        implicitHeight: (Theme.iconSize + Theme.dockMargin * 2) + Theme.frameWidth
        implicitWidth: ((Theme.iconSize + Theme.dockMargin) * dockRepeater.model) + Theme.dockMargin
        RowLayout {
            id: dockEntries

            spacing: Theme.dockMargin

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: Theme.dockMargin
            }

            Repeater {
                id: dockRepeater
                model: 6
                // placeholder for now
                Rectangle {
                    color: Theme.surfaceContainer

                    radius: Theme.dockRadius - Theme.dockMargin
                    implicitWidth: Theme.iconSize
                    implicitHeight: Theme.iconSize
                }
            }
        }
    }
}
