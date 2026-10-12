# Lily
A highly customizable desktop shell for Wayland, built with Quickshell.

> [!WARNING]
> Lily is still very early in development so expect breaking changes!
> Furthermore, everything inside this repo is pretty much unfinished including this README

## Installation
Right now Lily only works on Niri. Besides that you only need quickshell and Iosevka Nerd Font, which you can get from your distro's package manager, e.g. on Arch:
```sh
sudo pacman -S quickshell ttf-iosevka-nerd
```
Once that's done, clone this configuration like so:
```sh
git clone https://github.com/eljangus/Lily.git ~/.config/quickshell/Lily
```
After that you can launch Lily with:
```sh
quickshell -c Lily
```

### Important
This is only a temporary way to install Lily, proper packaging will be tackled later on.

### TODO
- [ ] Window title widget
- [ ] Audio widget (Pipewire)
- [ ] System tray
- [ ] Media widget (Mpris)
- [ ] Replace the Twinktangle placeholder widget
- [ ] Dock (currently hidden, margins hardcoded to one screen width)
- [ ] Bar position: top / bottom / left / right, incl. a vertical bar
- [ ] User-facing config instead of editing `Theme.qml`
- [ ] Theme switcher driving `Theme.qml`
- [ ] Proper packaging
- [ ] Touchpad scrolling switches a workspace per wheel event (needs accumulation)
- [ ] Split the long label ternary into properties, compute `tightBoundingRect` once
- [ ] Elided label is measured with the full text
- [ ] Label could use `CenteredText`
- [ ] `workspacesList` is only used as a temp
- [ ] Frame shadow has two strength knobs (`shadowOpacity` and `shadowColor` alpha)
- [ ] Capsule shadow alpha hardcoded → Theme
- [ ] Rename capsule-only `shadowBlur/Offset/Spread` → `capsuleShadow*`
- [ ] `RectangularShadow`: 4 equal corner radii → `radius`
- [ ] `barWidgetSpacing` < capsule shadow blur → neighbouring shadows overlap
- [ ] Leftover joke / rant comments and cleanup in general
