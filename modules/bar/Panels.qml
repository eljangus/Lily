import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        ConcaveCorners {
        }

    }

    Variants {
        model: Quickshell.screens

        ExclusivePanel {
            id: bottomFrame

            implicitHeight: Theme.frameWidth

            anchors {
                bottom: true
                right: true
                left: true
            }

        }

    }

    Variants {
        model: Quickshell.screens

        ExclusivePanel {
            id: leftFrame

            implicitWidth: Theme.frameWidth

            anchors {
                bottom: true
                top: true
                left: true
            }

        }

    }

    Variants {
        model: Quickshell.screens

        ExclusivePanel {
            id: rightFrame

            implicitWidth: Theme.frameWidth

            anchors {
                top: true
                right: true
                bottom: true
            }

        }

    }

    Variants {
        model: Quickshell.screens

        ExclusivePanel {
            id: topFrame

            implicitHeight: Theme.barHeight

            anchors {
                top: true
                right: true
                left: true
            }

        }

    }

}
