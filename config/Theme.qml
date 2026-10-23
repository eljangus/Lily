pragma Singleton
import QtQuick
import Quickshell

Singleton {
    // Surfaces (dark → light)
    readonly property color surfaceContainerLowest: "#0e0e0e"
    readonly property color surface: "#131314"
    readonly property color surfaceContainerLow: "#1b1b1c"
    readonly property color surfaceContainer: "#1f1f20"
    readonly property color surfaceContainerHigh: "#2a2a2a"
    readonly property color surfaceContainerHighest: "#353535"
    readonly property color surfaceBright: "#393939"
    readonly property real surfaceOpacity: 1
    // Text / lines on surfaces
    readonly property color textOnSurface: "#e5e2e2"
    readonly property color textOnSurfaceVariant: "#c4c7ca"
    readonly property color outline: "#8e9194"
    readonly property color outlineVariant: "#43474a"
    // Accents
    // Containers = muted version of the accent, light text on top
    readonly property color primary: "#c0c8cd"
    readonly property color textOnPrimary: "#2a3136"
    readonly property color primaryContainer: "#8a9297"
    readonly property color textOnPrimaryContainer: "#060d11"
    readonly property color secondary: "#c5c7c9"
    readonly property color textOnSecondary: "#2e3133"
    readonly property color secondaryContainer: "#444749"
    readonly property color textOnSecondaryContainer: "#b3b5b7"
    readonly property color tertiary: "#cdc3ce"
    readonly property color textOnTertiary: "#342e37"
    readonly property color tertiaryContainer: "#978e98"
    readonly property color textOnTertiaryContainer: "#0e0a11"
    readonly property color error: "#ffb4ab"
    readonly property color textOnError: "#690005"
    readonly property color errorContainer: "#93000a"
    readonly property color textOnErrorContainer: "#ffdad6"
    readonly property color shadowColor: "#000000"
    // Extras
    readonly property color warning: "#c5c7c9"
    readonly property color success: "#c0c8cd"
    // Fonts
    readonly property real widgetFontSize: 15
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    // Bar
    readonly property real barHeight: 50
    readonly property real barRadius: 0
    readonly property real barPaddingHor: 10
    readonly property real barPaddingVert: 6
    readonly property real barWidgetSpacing: 10
    readonly property real screenCornerRadius: 10
    readonly property real gothBottom: 0
    readonly property real gothLeft: 0
    readonly property real gothRight: 0
    readonly property real gothTop: 0
    readonly property real frameWidth: 0
    // Dock
    readonly property real dockMargin: 7
    readonly property real dockHoverZoneHeight: 20
    readonly property int iconSize: 64 // placeholder
    readonly property real dockRadius: screenCornerRadius
    readonly property real dockShowDelay: 150
    readonly property real dockHideDelay: 500
    // Shadows
    readonly property bool widgetShadowEnabled: false
    readonly property color widgetShadowColor: Qt.alpha(shadowColor, widgetShadowOpacity)
    readonly property real widgetShadowOpacity: 0.3
    readonly property real widgetShadowBlur: 16
    readonly property vector2d widgetShadowOffset: Qt.vector2d(0, 0)
    readonly property real widgetShadowSpread: -4
    readonly property bool frameShadowEnabled: true
    readonly property color frameShadowColor: Qt.alpha(shadowColor, frameShadowOpacity)
    readonly property real frameShadowOpacity: surfaceOpacity
    readonly property real frameShadowBlur: 0.6
    // Capsule (background behind each bar widget)
    readonly property real capsuleRadiusOverride: 20
    readonly property real capsuleRadius: capsuleRadiusOverride >= 0 ? capsuleRadiusOverride : Math.max(0, barRadius - barPaddingVert)
    readonly property real capsulePadding: 7
    readonly property real capsulePaddingHorizontal: 6
    readonly property real capsuleOpacity: surfaceOpacity * surfaceOpacity
    // railMargin makes it fit perfectly
    readonly property real railRadiusOverride: -1
    readonly property real railRadius: railRadiusOverride >= 0 ? railRadiusOverride : Math.max(0, capsuleRadius - railMargin)
    readonly property real railMargin: 7
    readonly property real dotExtraMargin: 2 // 0 to have no extra margin and have it perfectly spaced
    readonly property bool railSquareMode: false // true = perfect circle / square showing only the first character
    readonly property real railPadding: 0 // extra rail width, only used when railSquareMode is false
    readonly property real railMaxWidthRatio: 2
    // Animations and Extras
    readonly property real dockAnimationDuration: 200
    readonly property real rippleDurationScalePress: 300
    readonly property real rippleDurationOpacityPress: 80
    readonly property real rippleDurationOpacityRelease: 250
    readonly property real overlayOpacity: 0.04
    readonly property real overlayAnimationDuration: 200
}
