import QtQuick
import Quickshell

PanelWindow {
    required property var modelData
    required property string edge // something like "top" or "left"
    required property real size

    screen: modelData
    color: "transparent"
    implicitWidth: (edge === "left" || edge === "right") ? size : 0
    implicitHeight: (edge === "top" || edge === "bottom") ? size : 0
    exclusionMode: ExclusionMode.Auto

    mask: Region {}

    // anchor every edge except the opposite one
    anchors {
        top: edge !== "bottom"
        bottom: edge !== "top"
        left: edge !== "right"
        right: edge !== "left"
    }
}
