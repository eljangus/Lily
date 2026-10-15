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

        width: root.width
        height: root.height
        anchors.centerIn: parent
        // calculate the offset based of the text's true ink, not just the cell / space a character should take up
        // makes sure that e.g nerd font icons will always be centered in a WS pill
        anchors.horizontalCenterOffset: (width / 2) - (fontMetrics.tightBoundingRect(fontMetrics.elidedText(text, elide, width)).x + fontMetrics.tightBoundingRect(fontMetrics.elidedText(text, elide, width)).width / 2)
        anchors.verticalCenterOffset: (height / 2) - (baselineOffset + fontMetrics.tightBoundingRect(fontMetrics.elidedText(text, elide, width)).y + fontMetrics.tightBoundingRect(fontMetrics.elidedText(text, elide, width)).height / 2)
    }
}
