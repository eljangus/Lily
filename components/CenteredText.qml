import QtQuick

Item {
    id: root
    property alias font: inner.font
    property alias color: inner.color
    property alias text: inner.text
    property alias elide: inner.elide

    implicitWidth: inner.implicitWidth
    implicitHeight: inner.implicitHeight

    FontMetrics {
        id: fontMetrics

        font: inner.font
    }

    Text {
        id: inner

        property rect inkRect: fontMetrics.tightBoundingRect(fontMetrics.elidedText(text, elide, width))

        width: root.width
        height: root.height
        anchors.centerIn: parent
        // calculate the offset based of the text's true ink, not just the cell / space a character should take up
        // makes sure that e.g nerd font icons will always be centered in the workspace rail
        anchors.horizontalCenterOffset: (width / 2) - (inkRect.x + inkRect.width / 2)
        anchors.verticalCenterOffset: (height / 2) - (baselineOffset + inkRect.y + inkRect.height / 2)
    }
}
