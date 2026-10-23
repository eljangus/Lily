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
        color: Qt.alpha(Theme.surfaceContainer, Theme.capsuleOpacity)

        PointHandler {
            id: pointHandler

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

        Rectangle {
            id: capsuleOverlay

            anchors.fill: capsule
            radius: Theme.capsuleRadius
            color: Theme.textOnSurface
            opacity: hoverHandler.hovered || pointHandler.active ? Theme.overlayOpacity : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: Theme.overlayAnimationDuration
                }
            }
        }

        RowLayout {
            id: inner

            spacing: 5 // default value, usually overriden

            anchors {
                centerIn: capsule
            }
        }
    }
}
