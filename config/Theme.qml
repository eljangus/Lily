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
    readonly property string fontFamily: "Iosevka Nerd Font"
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
    readonly property real frameShadowOpacity: 1
    readonly property real frameShadowBlur: 0.6
    readonly property real shadowBlur: 16
    readonly property vector2d shadowOffset: Qt.vector2d(0, 0)
    readonly property real shadowSpread: -4
    readonly property bool enableWidgetShadow: false
    readonly property bool enableFrameShadow: true
    // Capsule (background behind each bar widget)
    readonly property real capsuleRadiusOverride: 30
    readonly property real capsuleRadius: capsuleRadiusOverride >= 0 ? capsuleRadiusOverride : Math.max(0, barRadius - barPaddingVert)
    readonly property real capsulePadding: 6
    readonly property real capsulePaddingHorizontal: 6
    // pillMargin makes it fit perfectly
    readonly property real pillRadiusOverride: -1
    readonly property real pillRadius: pillRadiusOverride >= 0 ? pillRadiusOverride : Math.max(0, capsuleRadius - pillMargin)
    readonly property real pillMargin: 5
    readonly property real pillExtraDotMarginOverride: 2
    readonly property real pillExtraDotMargin: pillExtraDotMarginOverride >= 0 ? pillExtraDotMarginOverride : 0
    readonly property real pillPaddingActiveOverride: 0 // -1 makes it a perfect circle / square
    readonly property real pillPaddingActive: pillPaddingActiveOverride >= 0 ? pillPaddingActiveOverride : 0
    readonly property real pillMaxActivePillWidth: 2
    // Animations and Extras
    readonly property real rippleDurationScalePress: 300
    readonly property real rippleDurationOpacityPress: 80
    readonly property real rippleDurationOpacityRelease: 250
    readonly property real rippleOpacity: 0.3
}
