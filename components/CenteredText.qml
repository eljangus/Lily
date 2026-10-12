import QtQuick
import qs.config

Item {
    id: root
    property alias font: inner.font
    property alias color: inner.color
    property alias text: inner.text

    implicitWidth: inner.implicitWidth
    implicitHeight: inner.implicitHeight

    FontMetrics {
        id: fontMetrics

        font: inner.font
    }

    Text {
        id: inner

        anchors.centerIn: parent
        anchors.horizontalCenterOffset: (width / 2) - (fontMetrics.tightBoundingRect(text).x + fontMetrics.tightBoundingRect(text).width / 2)
        anchors.verticalCenterOffset: (height / 2) - (baselineOffset + fontMetrics.tightBoundingRect(text).y + fontMetrics.tightBoundingRect(text).height / 2)
    }
}
