import QtQuick
import Quickshell
import qs.config

PanelWindow {
    required property var modelData

    screen: modelData
    color: "transparent"
    implicitHeight: Theme.frameWidth
    exclusionMode: ExclusionMode.Auto

    mask: Region {}
}
