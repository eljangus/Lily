import QtQuick
import Quickshell
pragma Singleton

Singleton {
    id: root

    property string twentyFourHourTimeDate: {
        Qt.formatDateTime(clock.date, "HH:mm 󰧟 d.M.yy");
    }

    SystemClock {
        id: clock

        precision: SystemClock.Minutes
    }

}
