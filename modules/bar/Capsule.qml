import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.components
import qs.config

Item {
    id: root

    default property alias content: inner.data
    property alias spacing: inner.spacing
    property real padding: Theme.capsulePadding * 2 + Theme.capsulePaddingHorizontal * 2

    implicitWidth: inner.implicitWidth + root.padding
    Layout.fillHeight: true

    HoverHandler {
        id: hoverHandler
    }

    // PointHandler just to make sure capsule stays highlighted if held
    PointHandler {
        id: pointHandler
    }

    RectangularShadow {
        visible: Theme.widgetShadowEnabled
        anchors.fill: capsule
        antialiasing: true
        blur: Theme.widgetShadowBlur
        radius: Theme.capsuleRadius
        offset: Theme.widgetShadowOffset
        spread: Theme.widgetShadowSpread
        color: Theme.widgetShadowColor
    }

    Rectangle {
        id: capsule

        anchors.fill: root
        radius: Theme.capsuleRadius
        color: (pointHandler.active || hoverHandler.hovered) ? Theme.surfaceContainerHigh : Theme.surfaceContainer

        PointHandler {
            id: pointArea

            onActiveChanged: {
                if (active) {
                    ripple.rippleAnimatePressed(point.position.x, point.position.y);
                } else {
                    ripple.rippleAnimateReleased();
                }
            }
        }

        Ripple {
            id: ripple

            rootRadius: Theme.capsuleRadius
            anchors.fill: parent
        }

        RowLayout {
            id: inner

            spacing: 5 // default value, usually overriden

            anchors {
                centerIn: capsule
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }
    }
}
