pragma Singleton
import QtQuick
import Quickshell

Singleton {
    // Surfaces (dark → light)
    readonly property color surfaceContainerLowest: "#ffffff"
    readonly property color surface: "#faf9f9"
    readonly property color surfaceContainerLow: "#f4f3f4"
    readonly property color surfaceContainer: "#eeeeee"
    readonly property color surfaceContainerHigh: "#e8e8e8"
    readonly property color surfaceContainerHighest: "#e3e2e3"
    readonly property color surfaceBright: "#faf9f9"
    // Text / lines on surfaces
    readonly property color textOnSurface: "#1a1c1c"
    readonly property color textOnSurfaceVariant: "#41484a"
    readonly property color outline: "#71787a"
    readonly property color outlineVariant: "#c1c8ca"
    // Accents
    // Containers = muted version of the accent, light text on top
    readonly property color primary: "#22444d"
    readonly property color textOnPrimary: "#ffffff"
    readonly property color primaryContainer: "#3a5c65"
    readonly property color textOnPrimaryContainer: "#afd3dd"
    readonly property color secondary: "#546164"
    readonly property color textOnSecondary: "#ffffff"
    readonly property color secondaryContainer: "#d7e5e9"
    readonly property color textOnSecondaryContainer: "#5a676a"
    readonly property color tertiary: "#473a56"
    readonly property color textOnTertiary: "#ffffff"
    readonly property color tertiaryContainer: "#5f516e"
    readonly property color textOnTertiaryContainer: "#d8c6e8"
    readonly property color error: "#ba1a1a"
    readonly property color textOnError: "#ffffff"
    readonly property color errorContainer: "#ffdad6"
    readonly property color textOnErrorContainer: "#93000a"
    readonly property color shadowColor: "#000000"
    // Extras
    readonly property color warning: "#546164"
    readonly property color success: "#22444d"
    // Fonts
    readonly property real widgetFontSize: 15
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    // Bar
    readonly property real barHeight: 50
    readonly property real barRadius: 0
    readonly property real barPaddingHor: 10
    readonly property real barPaddingVert: 8
    readonly property real barWidgetSpacing: 10
    readonly property real screenCornerRadius: 20
    readonly property real gothBottom: 0
    readonly property real gothLeft: 0
    readonly property real gothRight: 0
    readonly property real gothTop: 0
    readonly property real frameWidth: 15
    // Shadows
    readonly property bool widgetShadowEnabled: false
    readonly property color widgetShadowColor: Qt.alpha(shadowColor, widgetShadowOpacity)
    readonly property real widgetShadowOpacity: 0.3
    readonly property real widgetShadowBlur: 16
    readonly property vector2d widgetShadowOffset: Qt.vector2d(0, 0)
    readonly property real widgetShadowSpread: -4
    readonly property bool frameShadowEnabled: true
    readonly property color frameShadowColor: Qt.alpha(shadowColor, frameShadowOpacity)
    readonly property real frameShadowOpacity: 0.8
    readonly property real frameShadowBlur: 0.6
    // Capsule (background behind each bar widget)
    readonly property real capsuleRadiusOverride: 30
    readonly property real capsuleRadius: capsuleRadiusOverride >= 0 ? capsuleRadiusOverride : Math.max(0, barRadius - barPaddingVert)
    readonly property real capsulePadding: 6
    readonly property real capsulePaddingHorizontal: 6
    // railMargin makes it fit perfectly
    readonly property real railRadiusOverride: -1
    readonly property real railRadius: railRadiusOverride >= 0 ? railRadiusOverride : Math.max(0, capsuleRadius - railMargin)
    readonly property real railMargin: 5
    readonly property real dotExtraMargin: 2 // 0 to have no extra margin and have it perfectly spaced
    readonly property bool railSquareMode: false // true = perfect circle / square showing only the first character
    readonly property real railPadding: 0 // extra rail width, only used when railSquareMode is false
    readonly property real railMaxWidthRatio: 2
    // Animations and Extras
    readonly property real rippleDurationScalePress: 300
    readonly property real rippleDurationOpacityPress: 80
    readonly property real rippleDurationOpacityRelease: 250
    readonly property real rippleOpacity: 1
}
