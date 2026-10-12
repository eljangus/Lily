import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.services

Item {
    id: root

    property var screenName

    implicitHeight: Theme.barHeight

    RowLayout {
        id: widgetsLeft

        spacing: Theme.barWidgetSpacing

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            leftMargin: Theme.barPaddingHor
            topMargin: Theme.barPaddingVert
            bottomMargin: Theme.barPaddingVert
        }

        Launcher {}

        Workspaces {
            screenName: root.screenName
        }
    }

    RowLayout {
        id: widgetsMiddle

        spacing: Theme.barWidgetSpacing

        anchors {
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.barPaddingVert
            bottomMargin: Theme.barPaddingVert
        }

        Clock {}
    }

    RowLayout {
        id: widgetsRight

        spacing: Theme.barWidgetSpacing

        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            rightMargin: Theme.barPaddingHor
            topMargin: Theme.barPaddingVert
            bottomMargin: Theme.barPaddingVert
        }

        Twinktangle {}
    }
}
