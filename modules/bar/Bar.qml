import QtQuick
import QtQuick.Layouts
import qs.config

Item {
    id: root

    property string screenName

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
