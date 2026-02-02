# iOS Alert Project

This is a Theos tweak project that injects a native iOS alert popup.

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
