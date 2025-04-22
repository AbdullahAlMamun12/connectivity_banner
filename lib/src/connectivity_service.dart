import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';

/// A singleton service that provides real-time internet connectivity status
/// using periodic DNS lookups and exposes a [ValueNotifier] for UI reactivity.
///
/// This service uses `InternetAddress.lookup()` to determine if the device
/// has access to the internet and not just a network connection.
/// It is lightweight and requires no external dependencies.
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;

  ConnectivityService._internal() {
    _startMonitoring();
  }

  /// Notifies listeners whether the device is currently connected to the internet.
  final ValueNotifier<bool> isOnline = ValueNotifier(true);

  /// Begins a periodic DNS lookup to monitor internet connectivity every 4 seconds.
  ///
  /// Updates [isOnline] and optionally logs changes when the state toggles.
  void _startMonitoring() {
    Timer.periodic(const Duration(seconds: 4), (_) async {
      final previous = isOnline.value;
      try {
        final result = await InternetAddress.lookup('example.com').timeout(const Duration(seconds: 2));
        isOnline.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } catch (_) {
        isOnline.value = false;
      }

      // Optional: Only print/log when changed
      if (previous != isOnline.value) {
        debugPrint('Internet status changed: ${isOnline.value}');
      }
    });
  }

  /// Executes [onConnected] if the device is online; otherwise runs [onDisconnected].
  ///
  /// Both callbacks are optional.
  void action({VoidCallback? onConnected, VoidCallback? onDisconnected}) {
    isOnline.value ? onConnected?.call() : onDisconnected?.call();
  }
}
