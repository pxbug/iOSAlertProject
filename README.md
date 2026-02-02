# iOS Alert Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![Theos](https://img.shields.io/badge/Theos-Tweak-blue.svg)](https://github.com/theos/theos)

> English | [中文](README_ZH.md) | [繁體中文](README_ZHT.md)

This is a Theos tweak project that injects a native iOS alert popup.

**Author:** pxbug

## Structure
- `Tweak.x`: Source code containing the alert logic and hook.
- `Makefile`: Build configuration.
- `control`: Package information.
- `iOSAlertProject.plist`: Specifies which apps to inject into (Default: SpringBoard).

## How to Build
1. Ensure you have [Theos](https://github.com/theos/theos) installed.
2. Run `make package` in this directory.
3. The resulting `.deb` file will be in the `packages/` folder.

## Customization
- **Target App**: Edit `iOSAlertProject.plist` and change `com.apple.springboard` to your target app's Bundle ID (e.g., `com.apple.Maps`).
- **Alert Content**: Edit `Tweak.x` to change the title, message, or actions.

---

**Made with ❤️ by pxbug**
