# kiosk_mode

Allows starting "kiosk" mode where the user is locked to a restricted set of applications.

Currently, it only works in Android. All the methods will throw `FlutterMethodNotImplemented` in iOS.

## Start kiosk mode

```dart
await startKioskMode();
```

Request to put this activity in a mode where the user is locked to a restricted set of applications.

If `DevicePolicyManager#isLockTaskPermitted(String)` returns true for this component, the current task will be launched
directly into LockTask mode. Only apps allowlisted by `DevicePolicyManager#setLockTaskPackages(ComponentName, String[])`
can be launched while LockTask mode is active. The user will not be able to leave this mode until
`stopKioskMode()` is called. Calling this method while the device is already in LockTask mode has no effect.

Otherwise, the current task will be launched into screen pinning mode. In this case, the system will prompt the user
with a dialog requesting permission to use this mode. The user can exit at any time through instructions shown on the
request dialog. Calling `stopKioskMode()` will also terminate this mode.

## Stop kiosk mode

```dart
await stopKioskMode();
```

Called to end the LockTask or screen pinning mode started by `startKioskMode()`. Calling it when the app is not in kiosk
mode has no effect.