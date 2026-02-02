<div align="center">
  <img src="logo.jpeg" alt="iOS Alert Project Logo" width="200" />
</div>

# iOS Alert Project Release Notes

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![Theos](https://img.shields.io/badge/Theos-Tweak-blue.svg)](https://github.com/theos/theos)

> English | [中文](README_ZH.md) | [繁體中文](README_ZHT.md)

**Author:** pxbug

---

## 📦 Release Information

| Item | Details |
|------|---------|
| **Package Name** | `com.yunzhinet.iosalert` |
| **Tweak Name** | iOS Alert Project |
| **Version** | 1.0.0 |
| **Architecture** | iphoneos-arm |
| **Description** | A simple iOS native alert tweak |

---

## 📁 Files Included

```
iOSAlertProject/
├── Tweak.x                          # Main tweak source code
├── Makefile                         # Build configuration
├── control                          # Debian package metadata
├── iOSAlertProject.plist            # Injection filter configuration
├── logo.jpeg                        # Project logo
├── 1.png                            # Screenshot preview
├── README.md                        # English documentation
├── README_ZH.md                     # Simplified Chinese docs
├── README_ZHT.md                    # Traditional Chinese docs
└── packages/
    └── com.yunzhinet.iosalert_1.0.0-1+debug_iphoneos-arm.deb    # Debug package
```

### Generated Files (After Build)

After running `make package`, the following files will be generated:

```
.theos/
├── obj/
│   └── iOSAlertProject/
│       └── Tweak.x.o                # Compiled object file
├── _/
│   └── Library/
│       └── MobileSubstrate/
│           └── DynamicLibraries/
│               ├── iOSAlertProject.dylib    # Dynamic library (main tweak)
│               └── iOSAlertProject.plist    # Filter configuration
└── packages/
    └── com.yunzhinet.iosalert_1.0.0-1+debug_iphoneos-arm.deb
```

### Key Component: iOSAlertProject.dylib

| Property | Value |
|----------|-------|
| **Type** | iOS Dynamic Library (Mach-O) |
| **Architecture** | ARM (arm64) |
| **Role** | MobileSubstrate tweak injection |
| **Size** | ~10-20 KB (varies by build) |
| **Dependencies** | UIKit, CoreFoundation, Substrate |

---

## 🔧 Technical Details

### Tweak Information
- **Target Process**: `SpringBoard` (default)
- **Injection Filter**: `com.apple.UIKit`
- **Compiler Flags**: `-fobjc-arc`
- **Minimum iOS Version**: 7.0

### Hook Points
- **Notification**: `UIApplicationDidBecomeActiveNotification`
- **Purpose**: Show alert when app becomes active

### Alert Configuration
- **Title**: 温馨提示
- **Message**: iOS云智
- **Buttons**: 1 button (确定)
- **Display Behavior**: Once per app process lifetime

---

## 🚀 Installation

### Method 1: Build from Source

```bash
# Clone the repository
git clone https://github.com/pxbug/iOSAlertProject.git
cd iOSAlertProject

# Install Theos dependencies (if not installed)
# Follow: https://github.com/theos/theos/wiki/Installation

# Build the package
make package

# Install via SSH (device IP required)
make install
```

### Method 2: Install .deb Package

```bash
# Using a package manager (e.g., Filza, Zebra)
1. Transfer `.deb` file to your iOS device
2. Open with Filza or similar package installer
3. Tap "Install"

# Or via terminal
dpkg -i com.yunzhinet.iosalert_1.0.0-1+debug_iphoneos-arm.deb
```

---

## ⚠️ Notes

- **Sandbox Permissions**: Some system apps or apps with strict sandbox restrictions may block injection or popups, but it should work in most regular apps and system apps.
- **Repeated Popups**: Currently, the logic shows the popup only once per app process lifetime (using `static BOOL hasShown`). If you kill and restart the app, the popup will appear again.

---

## 📝 Changelog

### v1.0.0 (2026-02-02)
- ✨ Initial release
- 💬 Show native iOS alert popup
- 🎯 Inject into SpringBoard by default
- 🔧 Easy customization via Tweak.x and plist

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

<div align="center">

**Made with ❤️ by pxbug**

</div>
