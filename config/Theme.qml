pragma Singleton
import QtQuick
import Quickshell

Singleton {
    // Surfaces (dark → light)
    readonly property color surfaceContainerLowest: "#151515"
    readonly property color surface: "#151515"
    readonly property color surfaceContainerLow: "#151515"
    readonly property color surfaceContainer: "#222222"
    readonly property color surfaceContainerHigh: "#2a2a2a"
    readonly property color surfaceContainerHighest: "#414141"
    readonly property color surfaceBright: "#414141"
    // Text / lines on surfaces
    readonly property color textOnSurface: "#e8e3e3"
    readonly property color textOnSurfaceVariant: "#b0b0b0"
    readonly property color outline: "#414141"
    readonly property color outlineVariant: "#222222"
    // Accents
    // Containers = muted version of the accent, light text on top
    readonly property color primary: "#8da3b9"
    readonly property color textOnPrimary: "#151515"
    readonly property color primaryContainer: "#8da3b9"
    readonly property color textOnPrimaryContainer: "#151515"
    readonly property color secondary: "#a988b0"
    readonly property color textOnSecondary: "#151515"
    readonly property color secondaryContainer: "#8aa6a2"
    readonly property color textOnSecondaryContainer: "#151515"
    readonly property color tertiary: "#8aa6a2"
    readonly property color textOnTertiary: "#151515"
    readonly property color tertiaryContainer: "#a988b0"
    readonly property color textOnTertiaryContainer: "#151515"
    readonly property color error: "#b66467"
    readonly property color textOnError: "#151515"
    readonly property color errorContainer: "#b66467"
    readonly property color textOnErrorContainer: "#151515"
    readonly property color shadowColor: "#000000"
    // Extras
    readonly property color warning: "#d9bc8c"
    readonly property color success: "#8c977d"
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
