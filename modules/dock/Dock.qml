import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData
            visible: false
            exclusionMode: ExclusionMode.Normal
            exclusiveZone: 0
            color: "transparent"
            implicitHeight: dock.implicitHeight

            anchors {
                bottom: true
                left: true
                right: true
            }

            ClippingRectangle {
                id: dock

                radius: 20
                contentInsideBorder: true
                implicitHeight: 100
                anchors.fill: parent
                color: Theme.surface
            }

            // qmllint disable unqualified unresolved-type
            margins {
                bottom: 10
                left: 700
                right: 700
            }

            Text {
                color: Theme.textOnSurface
                font.pointSize: Theme.widgetFontSize
                font.family: Theme.fontFamily
                anchors.centerIn: parent
                text: "Dock"
            }
        }
    }
}
