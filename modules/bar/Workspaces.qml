import QtQuick
import qs.config
import qs.services

Capsule {
    id: root

    property string screenName
    property real dotSize: root.height / 4
    property real activePillWidth: Math.min(rail.height + Theme.pillPaddingActive + (Theme.pillPaddingActiveOverride >= 0 ? widestLabelPerOutput() : 0), rail.height * Theme.pillMaxActivePillWidth)
    property real railGap: (root.height - rail.implicitHeight) / 2
    property real textGap: (rail.height - fontMetrics.tightBoundingRect("O").height) / 2 // "O" is just a reference string, if you like using Umlauts or other characters in your ws names, you may use something like "Ö" instead
    property real dotMargin: (railGap + rail.width / 2 - dotSize / 2) / 2 + Theme.pillExtraDotMargin
    property real dotSlot: dotMargin * 2 + dotSize
    property real rowWidth: (Niri.largestIdx[root.screenName]) * dotSlot + edgePadding * 2
    property real edgePadding: railGap + (rail.width - dotSlot) / 2
    property real pillFontSize: Math.max(0, rail.height * 0.65)
    property bool isPaddingOverride: Theme.pillPaddingActiveOverride < 0

    implicitWidth: rowWidth

    function widestLabelPerOutput() {
        let longestLabel = {
            [root.screenName]: 0
        };
        let measureWidth = fontMetrics.advanceWidth;
        for (let i = 0; i < Niri.workspaces.count; i++) {
            let ws = Niri.workspaces.get(i);
            if (root.screenName === ws.output) {
                if (ws.name && (measureWidth(ws.name) > longestLabel[root.screenName])) {
                    longestLabel[root.screenName] = measureWidth(ws.name);
                }
                if ((!ws.name) && (measureWidth(ws.idx) > longestLabel[root.screenName])) {
                    longestLabel[root.screenName] = measureWidth(ws.idx);
                }
            }
        }
        return longestLabel[root.screenName];
    }

    function getChar(string, char) {
        return [...string][char];
    }

    WheelHandler {
        id: scrollWheelWorkspaces

        parent: root
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        orientation: Qt.Vertical
        onWheel: event => {
            if (event.angleDelta.y < 0)
                Niri.scrollWorkspaces("FocusWorkspaceDown");
            if (event.angleDelta.y > 0)
                Niri.scrollWorkspaces("FocusWorkspaceUp");
        }
    }

    Rectangle {
        id: rail

        parent: root
        implicitWidth: root.activePillWidth
        implicitHeight: root.height - Theme.pillMargin * 2
        y: (root.height - implicitHeight) / 2
        x: (Niri.activeIdx[root.screenName] - 1) * root.dotSlot + root.dotMargin + root.edgePadding - rail.width / 2 + root.dotSize / 2
        radius: Theme.pillRadius
        color: Theme.primary

        Behavior on x {
            NumberAnimation {
                duration: 170
                easing.type: Easing.OutBack
            }
        }

        FontMetrics {
            id: fontMetrics

            font.family: Theme.fontFamily
            font.pixelSize: root.pillFontSize
        }

        Text {
            id: wsText

            width: rail.width - root.textGap * 2
            elide: Text.ElideRight
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: (contentWidth / 2) - (fontMetrics.tightBoundingRect(text).x + fontMetrics.tightBoundingRect(text).width / 2)
            anchors.verticalCenterOffset: (height / 2) - (baselineOffset + fontMetrics.tightBoundingRect(text).y + fontMetrics.tightBoundingRect(text).height / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            // gl yo
            text: ((Niri.activeName[root.screenName] && root.isPaddingOverride) ? root.getChar(Niri.activeName[root.screenName], 0) : Niri.activeName[root.screenName] ? Niri.activeName[root.screenName] : (root.isPaddingOverride && Niri.activeIdx[root.screenName]) ? Niri.activeIdx[root.screenName] % 10 : Niri.activeIdx[root.screenName]) ?? ""
            color: Theme.surfaceContainer
            font.pixelSize: root.pillFontSize
            font.family: Theme.fontFamily
        }
    }

    Repeater {
        id: dotsRepeater

        // to make sure NOT to use RowLayout
        parent: root
        model: Niri.workspaces

        Rectangle {
            id: pills
            // lord have mercy
            x: (model.idx - 1) * root.dotSlot + root.dotMargin + root.edgePadding
            y: (root.height - pills.height) / 2

            TapHandler {
                id: tapWorkspacePills

                enabled: true
                parent: pills
                longPressThreshold: 0
                gesturePolicy: TapHandler.DragThreshold
                onTapped: {
                    Niri.focusWorkspace(model.id);
                }
            }

            HoverHandler {
                id: hoverWorkspacePills

                enabled: parent.enabled
                parent: pills
                // enable blocking to no longer hover the capsule once you hover a pill
                blocking: false
                cursorShape: model.isActive ? Qt.ArrowCursor : Qt.PointingHandCursor
            }

            PointHandler {
                id: pointWorkspacePills
            }

            visible: root.screenName === model.output
            color: model.isUrgent ? Theme.error : (hoverWorkspacePills.hovered || pointWorkspacePills.active) ? Theme.secondary : model.isActive ? Theme.primary : Theme.textOnSurface
            opacity: model.isUrgent ? 1 : (hoverWorkspacePills.hovered || pointWorkspacePills.active) ? 1 : model.isOccupied ? 0.8 : 0.2
            implicitWidth: dotSize
            implicitHeight: dotSize
            radius: Theme.pillRadius

            Behavior on color {
                ColorAnimation {
                    duration: 80
                }
            }

            Behavior on opacity {
                OpacityAnimator {
                    duration: 150
                }
            }
        }
    }
}
