<img src="http://www.zold.io/logo.svg" width="92px" height="92px"/>

[![Donate via Zerocracy](https://www.0crat.com/contrib-badge/CAZPZR9FS.svg)](https://www.0crat.com/contrib/CAZPZR9FS)

[![EO principles respected here](http://www.elegantobjects.org/badge.svg)](http://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/CAZPZR9FS.svg)](https://www.0crat.com/p/CAZPZR9FS)

[![Hits-of-Code](https://hitsofcode.com/github/zold-io/izolda)](https://hitsofcode.com/github/zold-io/izolda)

This is iOS mobile wallet for ZLD coins.

## Architecture

The app targets [iOS](https://developer.apple.com/ios/) exclusively, written in [Swift](https://swift.org) with [UIKit](https://developer.apple.com/documentation/uikit), rather than a cross-platform runtime such as [React Native](https://reactnative.dev) or [Flutter](https://flutter.dev). The [Zold protocol](https://www.zold.io/wp.pdf) requires an RSA private key to sign every outgoing transaction; iOS's [Keychain Services](https://developer.apple.com/documentation/security/keychain_services) API is the only mechanism that stores private key material in the device's hardware-backed Secure Enclave, and it is accessible without bridging overhead only from a native Swift app.

The app uses [Core Data](https://developer.apple.com/documentation/coredata) as its local persistence layer rather than reading and writing the [Zold plain-text wallet file format](https://github.com/zold-io/zold#wallet-file-format) directly. Core Data provides an object graph with built-in change notification via `NSFetchedResultsController`, so balance and transaction list views update automatically when a background network fetch writes new data to the store — synchronization that would otherwise require manual [KVO](https://developer.apple.com/documentation/swift/using_key-value_observing_in_swift) or `NotificationCenter` wiring on every screen.

No Zold node runs inside the app; instead, the app is a thin client that fetches wallet files from and pushes signed transactions to remote nodes via the [Zold HTTP API](https://github.com/zold-io/zold#api). Embedding a node would require continuous background execution and the capacity to store other users' wallet files — both constrained by [iOS background execution limits](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background) and the [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) on battery and storage use.

## How to Contribute

I have no idea as of yet...
