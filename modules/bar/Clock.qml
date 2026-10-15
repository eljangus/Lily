import QtQuick
import qs.config
import qs.services
import qs.components

Capsule {
    id: root

    CenteredText {
        text: Time.twentyFourHourTimeDate
        color: Theme.textOnSurface
        font.pointSize: Theme.widgetFontSize
        font.family: Theme.fontFamily
    }
}
