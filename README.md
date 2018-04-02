# The Bug

Launching an app from a notification that contains `additionalActions` will not include that clicked notification in `NSApplicationLaunchUserNotificationKey`.

```
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // This is nil!
    aNotification.userInfo[NSApplicationLaunchUserNotificationKey];
}
```


# To Test:

1. Build and run from Xcode
2. click each button once, to create each type of notification
3. quit app
4. Click the "Additional Options" notification (the body of it, not the Close/Accept buttons)
5. app launches, but doesn't show NSApplicationLaunchUserNotificationKey
6. quit app
7. Click the "No Additional Options" notification
8. app launches and /does/ show a notification for NSApplicationLaunchUserNotificationKey
