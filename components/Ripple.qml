pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import qs.config

Item {
    id: root
    // 1 because stencil is a visual element, therefore the layer should only be enabled once more than 1 visual item exists, that would be a circle created by createObject
    layer.enabled: 1 < root.children.length
    layer.effect: MultiEffect {
        maskEnabled: true
        maskSource: stencil
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }

    required property real rootRadius
    property Item newestCircle

    function rippleAnimatePressed(x, y) {
        if (newestCircle) {
            newestCircle.stopAnim();
        }
        newestCircle = rippleCreator.createObject(root, {
            posX: x,
            posY: y
        });
        if (newestCircle) {
            newestCircle.startAnim();
        }
    }

    function rippleAnimateReleased() {
        if (newestCircle) {
            newestCircle.stopAnim();
        }
        newestCircle = null;
    }

    Rectangle {
        id: stencil

        layer.enabled: true
        visible: false
        anchors.fill: parent
        radius: root.rootRadius
    }

    Component {
        id: rippleCreator

        Rectangle {
            id: ripple
            property real circleDiameter: Math.max(topLeftCorner, bottomLeftCorner, topRightCorner, bottomRightCorner) * 2
            property real topLeftCorner: Math.hypot(posX - 0, posY - 0)
            property real bottomLeftCorner: Math.hypot(posX - 0, posY - root.height)
            property real topRightCorner: Math.hypot(posX - root.width, posY - 0)
            property real bottomRightCorner: Math.hypot(posX - root.width, posY - root.height)
            property real posX
            property real posY

            width: circleDiameter
            height: circleDiameter
            x: posX - (ripple.width / 2)
            y: posY - (ripple.height / 2)
            color: Theme.surfaceContainerHighest
            radius: Math.max(width, height) * 0.5
            opacity: 0

            function startAnim() {
                growAnim.start();
                pressAnim.start();
            }

            function stopAnim() {
                pressAnim.stop();
                releaseAnim.start();
            }

            NumberAnimation {
                id: growAnim
                target: ripple
                easing.type: Easing.OutQuart
                property: "scale"
                from: 0
                to: 1
                duration: Theme.rippleDurationScalePress
            }

            NumberAnimation {
                id: pressAnim
                target: ripple
                property: "opacity"
                from: 0
                to: Theme.rippleOpacity
                duration: Theme.rippleDurationOpacityPress
            }

            NumberAnimation {
                id: releaseAnim
                target: ripple
                easing.type: Easing.InQuart
                property: "opacity"
                to: 0
                duration: Theme.rippleDurationOpacityRelease
                onFinished: {
                    ripple.destroy();
                }
            }
        }
    }
}
