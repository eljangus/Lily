import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config

PanelWindow {
    id: bar

    required property var modelData

    screen: modelData
    color: "transparent"
    implicitHeight: Theme.frameWidth
    exclusionMode: ExclusionMode.Auto

    mask: Region {
    }

}
