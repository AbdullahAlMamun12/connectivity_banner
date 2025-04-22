import 'package:flutter/cupertino.dart';
import '../connectivity_banner.dart';

/// A utility class that provides static access to network-aware functionality
/// using the [ConnectivityService] singleton instance.
///
/// This class simplifies access to checking and reacting to internet connectivity.
class Connectivity {
  static final ConnectivityService _instance = ConnectivityService();

  /// Runs [onConnected] if the device is currently online,
  /// otherwise runs [onDisconnected] if provided.
  ///
  /// Example:
  /// ```dart
  /// Connectivity.run(
  ///   onConnected: () => print('You are online!'),
  ///   onDisconnected: () => print('No internet connection.'),
  /// );
  /// ```
  static void run({VoidCallback? onConnected, VoidCallback? onDisconnected}) {
    _instance.action(onConnected: onConnected, onDisconnected: onDisconnected);
  }
}