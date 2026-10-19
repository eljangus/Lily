import QtQuick
import Quickshell
import qs.config
import qs.modules.bar

Variants {
    model: Quickshell.screens

    Scope {
        id: screenScope

        required property var modelData

        Frame {
            modelData: screenScope.modelData
        }

        ExclusivePanel {
            modelData: screenScope.modelData
            edge: "bottom"
            size: Theme.frameWidth
        }

        ExclusivePanel {
            modelData: screenScope.modelData
            edge: "left"
            size: Theme.frameWidth
        }

        ExclusivePanel {
            modelData: screenScope.modelData
            edge: "right"
            size: Theme.frameWidth
        }

        ExclusivePanel {
            modelData: screenScope.modelData
            edge: "top"
            size: Theme.barHeight
        }
    }
}
