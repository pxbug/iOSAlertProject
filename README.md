<div align="center">
  <img src="logo.jpeg" alt="iOS Alert Project Logo" width="200" />

# iOS Alert Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![Theos](https://img.shields.io/badge/Theos-Tweak-blue.svg)](https://github.com/theos/theos)

> English | [中文](README_ZH.md) | [繁體中文](README_ZHT.md)

This is a Theos tweak project that injects a native iOS alert popup.

**Author:** pxbug

</div>

## Structure
- `Tweak.x`: Source code containing the alert logic and hook.
- `Makefile`: Build configuration.
- `control`: Package information.
- `iOSAlertProject.plist`: Specifies which apps to inject into (Default: SpringBoard).

## Preview
<div align="center">
  <img src="1.png" alt="iOS Alert Popup Preview" width="300" />
</div>

## How to Build
1. Ensure you have [Theos](https://github.com/theos/theos) installed.
2. Run `make package` in this directory.
3. The resulting `.deb` file will be in the `packages/` folder.

## Customization
- **Target App**: Edit `iOSAlertProject.plist` and change `com.apple.springboard` to your target app's Bundle ID (e.g., `com.apple.Maps`).
- **Alert Content**: Edit `Tweak.x` to change the title, message, or actions.

## Notes
- **Sandbox Permissions**: Some system apps or apps with strict sandbox restrictions may block injection or popups, but it should work in most regular apps and system apps.
- **Repeated Popups**: Currently, the logic shows the popup only once per app process lifetime (using `static BOOL hasShown`). If you kill and restart the app, the popup will appear again.

---

<div align="center">

**Made with ❤️ by pxbug**

</div>
