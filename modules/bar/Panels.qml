import QtQuick
import Quickshell
import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        ConcaveCorners {}
    }

    Variants {
        model: Quickshell.screens

        ExclusivePanel {
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
            implicitHeight: Theme.barHeight

            anchors {
                top: true
                right: true
                left: true
            }
        }
    }
}
