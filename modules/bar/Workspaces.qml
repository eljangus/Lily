pragma ComponentBehavior: Bound
import QtQuick
import qs.config
import qs.components
import qs.services

Capsule {
    id: root

    property string screenName
    property real dotSize: root.height / 5
    property real railWidth: Math.min(rail.height + (Theme.railSquareMode ? 0 : Theme.railPadding + widestLabelPerOutput()), rail.height * Theme.railMaxWidthRatio)
    property real railGap: (root.height - rail.implicitHeight) / 2
    property real textGap: (rail.height - fontMetrics.tightBoundingRect("O").height) / 2 // "O" is just a reference string, if you like using Umlauts or other characters in your ws names, you may use something like "Ö" instead
    property real dotMargin: (railGap + rail.width / 2 - dotSize / 2) / 2 + Theme.dotExtraMargin
    property real dotSlot: dotMargin * 2 + dotSize
    property real rowWidth: (Niri.largestIdx[root.screenName]) * dotSlot + edgePadding * 2
    property real edgePadding: railGap + (rail.width - dotSlot) / 2
    property real railFontSize: Math.max(0, rail.height * 0.65)
    property string niriActiveName: Niri.activeName[root.screenName] ?? ""
    property int niriActiveIdx: Niri.activeIdx[root.screenName] ?? 0

    onNiriActiveIdxChanged: {
        if (root.niriActiveIdx)
            Qt.callLater(() => xAnim.enabled = true);
    }

    function getWsText() {
        if (root.niriActiveName && Theme.railSquareMode)
            return root.getChar(root.niriActiveName, 0);
        if (root.niriActiveName)
            return root.niriActiveName;
        if (Theme.railSquareMode)
            return root.niriActiveIdx % 10;
        return root.niriActiveIdx;
    }

    function widestLabelPerOutput() {
        let widestLabelWidth = 0;
        let measureWidth = fontMetrics.advanceWidth;
        for (let i = 0; i < Niri.workspaces.count; i++) {
            let ws = Niri.workspaces.get(i);
            if (root.screenName !== ws.output)
                continue;
            let labelWidth = measureWidth(ws.name) || measureWidth(ws.idx);
            if (labelWidth > widestLabelWidth)
                widestLabelWidth = labelWidth;
        }
        return widestLabelWidth;
    }

    function getChar(string, index) {
        return [...string][index];
    }

    implicitWidth: rowWidth

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

        visible: root.niriActiveIdx !== 0
        parent: root
        implicitWidth: root.railWidth
        implicitHeight: root.height - Theme.railMargin * 2
        y: (root.height - implicitHeight) / 2
        x: (root.niriActiveIdx - 1) * root.dotSlot + root.dotMargin + root.edgePadding - rail.width / 2 + root.dotSize / 2
        radius: Theme.railRadius
        color: Theme.primary

        Behavior on x {
            id: xAnim
            enabled: false
            NumberAnimation {
                duration: 170
                easing.type: Easing.OutBack
            }
        }

        FontMetrics {
            id: fontMetrics

            font.family: Theme.fontFamily
            font.pixelSize: root.railFontSize
        }

        CenteredText {
            id: wsText

            elide: Text.ElideRight
            width: rail.width - root.textGap * 2
            anchors.centerIn: rail
            text: root.getWsText()
            color: Theme.textOnPrimary
            font.pixelSize: root.railFontSize
            font.family: Theme.fontFamily
        }
    }

    Repeater {
        id: dotsRepeater

        // to make sure NOT to use RowLayout
        parent: root
        model: Niri.workspaces

        Rectangle {
            id: dot

            required property int wsId
            required property int idx
            required property bool isActive
            required property bool isOccupied
            required property bool isUrgent
            required property string output

            x: (dot.idx - 1) * root.dotSlot + root.dotMargin + root.edgePadding
            y: (root.height - dot.height) / 2

            TapHandler {
                longPressThreshold: 0
                gesturePolicy: TapHandler.DragThreshold
                onTapped: {
                    Niri.focusWorkspace(dot.wsId);
                }
            }

            HoverHandler {
                id: hoverWorkspaceDot

                enabled: parent.enabled
                // enable blocking to no longer hover the capsule once you hover a dot
                blocking: false
                cursorShape: dot.isActive ? Qt.ArrowCursor : Qt.PointingHandCursor
            }

            PointHandler {
                id: pointWorkspaceDot
            }

            visible: root.screenName === dot.output
            color: dot.isUrgent ? Theme.error : (hoverWorkspaceDot.hovered || pointWorkspaceDot.active) ? Theme.secondary : dot.isActive ? Theme.primary : Theme.textOnSurface
            opacity: dot.isUrgent ? 1 : (hoverWorkspaceDot.hovered || pointWorkspaceDot.active) ? 1 : dot.isOccupied ? 0.8 : 0.2
            implicitWidth: root.dotSize
            implicitHeight: root.dotSize
            radius: Theme.railRadius

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
