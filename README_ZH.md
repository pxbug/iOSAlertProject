# iOS 弹窗项目

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![Theos](https://img.shields.io/badge/Theos-Tweak-blue.svg)](https://github.com/theos/theos)

> English | 中文 | [繁體中文](README_ZHT.md)

这是一个 Theos tweak 项目，用于在 iOS 中注入原生弹窗。

**作者:** pxbug

## 项目结构
- `Tweak.x`: 包含弹窗逻辑和 hook 源码。
- `Makefile`: 构建配置。
- `control`: 包信息。
- `iOSAlertProject.plist`: 指定要注入的应用程序（默认: SpringBoard）。

## 构建方法
1. 确保已安装 [Theos](https://github.com/theos/theos)。
2. 在当前目录运行 `make package`。
3. 生成的 `.deb` 文件将在 `packages/` 文件夹中。

## 自定义
- **目标应用**: 编辑 `iOSAlertProject.plist`，将 `com.apple.springboard` 改为您目标应用的 Bundle ID（例如: `com.apple.Maps`）。
- **弹窗内容**: 编辑 `Tweak.x` 来修改标题、消息或按钮。

---

**由 pxbug ❤️ 制作**
