#import <UIKit/UIKit.h>

// Helper to find the top most view controller
static UIViewController * _Nullable TopViewController(UIViewController * _Nullable controller) {
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return TopViewController([(UINavigationController *)controller visibleViewController]);
    }
    if ([controller isKindOfClass:[UITabBarController class]]) {
        return TopViewController([(UITabBarController *)controller selectedViewController]);
    }
    if (controller.presentedViewController) {
        return TopViewController(controller.presentedViewController);
    }
    return controller;
}

static UIViewController * _Nullable GetTopViewController() {
    UIWindow *keyWindow = nil;
    
    // Modern iOS approach (iOS 13+)
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in scene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
            }
            if (keyWindow) break;
        }
    }
    
    // Fallback or legacy approach
    if (!keyWindow) {
        keyWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    if (!keyWindow && [UIApplication sharedApplication].windows.count > 0) {
        keyWindow = [UIApplication sharedApplication].windows.firstObject;
    }

    return TopViewController(keyWindow.rootViewController);
}

static void ShowAlert() {
    // Ensure we are on main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *topVC = GetTopViewController();
        
        // If no VC found, retry fast
        if (!topVC) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                ShowAlert();
            });
            return;
        }

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                     message:@"iOS云智"
                                                              preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {
                                                                  NSLog(@"[iOSAlertProject] Confirm tapped");
                                                              }];

        [alert addAction:confirmAction];

        [topVC presentViewController:alert animated:YES completion:nil];
    });
}

%ctor {
    // Listen for application becoming active to show the alert
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification 
                                                      object:nil 
                                                       queue:[NSOperationQueue mainQueue] 
                                                  usingBlock:^(NSNotification *note) {
        
        static BOOL hasShown = NO;
        if (!hasShown) {
            ShowAlert();
            hasShown = YES;
        }
    }];
}
