# connectivity_banner

`connectivity_banner` is a lightweight Flutter package that displays a customizable banner at the top or bottom of your app when the device loses internet connectivity.

It uses Dart's `InternetAddress.lookup()` internally—no platform channels, no native code, and no external dependencies.

## ✨ Features

- 🔴 Displays a banner when internet is not available
- 🛠 Fully customizable: color, height, alignment, message
- 🔁 Auto-checks connectivity with DNS lookups
- ⚡ Singleton-based service with global access
- ✅ No `connectivity_plus`, no native dependencies

## 🚀 Getting started

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  connectivity_banner: ^1.0.0
```

No setup or permissions needed—just import and use.

## 💡 Usage

Wrap your widget with `ConnectivityBanner`:

```dart
import 'package:connectivity_banner/connectivity_banner.dart';

ConnectivityBanner(
  bannerMessage: "You are offline!",
  child: Scaffold(
    appBar: AppBar(title: Text("My App")),
    body: Center(child: Text("Main content")),
  ),
)
```

Or run code conditionally:

```dart
Connectivity.run(
  onConnected: () => print('Online'),
  onDisconnected: () => print('Offline'),
);
```

## 📁 Example

See `/example` for a working app.

## 🙌 Contributing

Issues and pull requests are welcome! For bugs or feature requests, please file an issue.

## 📄 License

MIT © 2024 [Abdullah Al Mamun](https://github.com/AbdullahAlMamun12)
