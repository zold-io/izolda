<img src="http://www.zold.io/logo.svg" width="92px" height="92px"/>

[![Donate via Zerocracy](https://www.0crat.com/contrib-badge/CAZPZR9FS.svg)](https://www.0crat.com/contrib/CAZPZR9FS)

[![EO principles respected here](http://www.elegantobjects.org/badge.svg)](http://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/CAZPZR9FS.svg)](https://www.0crat.com/p/CAZPZR9FS)

[![Hits-of-Code](https://hitsofcode.com/github/zold-io/izolda)](https://hitsofcode.com/github/zold-io/izolda)

This is iOS mobile wallet for ZLD coins.

## Architecture

[Zold](https://www.zold.io) stores no global blockchain; each wallet is an independently signed flat file identified by a 64-bit ID and validated with the owner's [RSA-4096](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) private key. Unlike [Bitcoin](https://bitcoin.org) or [Ethereum](https://ethereum.org), there is no consensus chain to download or verify — the app only needs to fetch, validate, and push a single file per wallet, which keeps network round-trips minimal and makes the app viable on high-latency cellular connections.

The RSA private key never leaves the device; it must be generated on first launch and stored in the iOS [Keychain](https://developer.apple.com/documentation/security/keychain_services) rather than in [Core Data](https://developer.apple.com/documentation/coredata) or any file the OS may include in an iCloud backup. Anything stored outside the Keychain can be extracted from an unencrypted device backup, so the Keychain is the only acceptable container for the signing key.

[Core Data](https://developer.apple.com/documentation/coredata) with an `NSPersistentContainer` caches the last-known wallet state on-device so the balance and transaction list are readable without a live network connection. The container is bootstrapped in `AppDelegate` rather than lazily in a view controller because the persistent store must be ready before any screen renders; `AppDelegate` also receives `applicationWillTerminate`, giving the OS a chance to flush unsaved changes. The data model (`izolda.xcdatamodel`) is currently empty and must be populated with entities that mirror the Zold [wallet file format](https://github.com/zold-io/zold/blob/master/wp/wp.pdf) before any persistence logic can be added.

The UI is defined entirely in `Main.storyboard` using [UIKit](https://developer.apple.com/documentation/uikit) with [Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/), targeting iOS 9 and later. All navigation between the Entrance and Transactions screens is expressed as storyboard segues so the transition graph is visible in Interface Builder without reading Swift source. Each screen should become its own `UIViewController` subclass as logic is added; expanding the single shared `ViewController` would conflate unrelated responsibilities.

The Transactions screen exposes exactly the three operations the [Zold node HTTP API](https://github.com/zold-io/zold) supports for a wallet: **Send** (sign and push a payment transaction to the network), **Receive** (display the wallet ID as a target for incoming payments), and **Migrate** (re-register the wallet with a different node when the current node is unreachable). Any operation added to this screen requires a corresponding capability in the node API first.

## How to Contribute

I have no idea as of yet...
