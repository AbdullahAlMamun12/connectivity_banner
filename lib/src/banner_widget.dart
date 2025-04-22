import 'package:flutter/material.dart';
import 'connectivity_service.dart';

/// A widget that wraps your content and displays a banner when internet is unavailable.
///
/// This is useful for alerting users when connectivity is lost, and can be styled
/// and positioned according to your layout needs.
class ConnectivityBanner extends StatelessWidget {
  final Widget child;
  final VoidCallback? onConnected;

  // Styling options
  final Alignment bannerAlignment;
  final Color bannerColor;
  final TextStyle bannerTextStyle;
  final EdgeInsets bannerPadding;
  final double bannerHeight;
  final bool showAtTop;
  final String bannerMessage;

  /// Creates a [ConnectivityBanner] that shows a connection alert message.
  ///
  /// - [child]: The main widget to display.
  /// - [onConnected]: Callback that runs once when internet is restored.
  /// - [bannerAlignment]: Aligns the banner text.
  /// - [bannerColor]: Background color of the banner.
  /// - [bannerTextStyle]: Style for the banner message text.
  /// - [bannerPadding]: Padding inside the banner container.
  /// - [bannerHeight]: Height of the banner.
  /// - [showAtTop]: If true, shows banner at the top; otherwise at the bottom.
  /// - [bannerMessage]: The message displayed in the banner when offline.
  const ConnectivityBanner({
    super.key,
    required this.child,
    this.onConnected,
    this.bannerAlignment = Alignment.center,
    this.bannerColor = Colors.red,
    this.bannerTextStyle = const TextStyle(color: Colors.white),
    this.bannerPadding = EdgeInsets.zero,
    this.bannerHeight = 30.0,
    this.showAtTop = true,
    this.bannerMessage = 'No Internet Connection',
  });

  /// Builds the banner UI and handles dynamic placement based on connectivity status.
  @override
  Widget build(BuildContext context) {
    final service = ConnectivityService();

    return ValueListenableBuilder<bool>(
      valueListenable: service.isOnline,
      builder: (context, isConnected, _) {
        if (isConnected && onConnected != null) onConnected!();

        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: !isConnected && showAtTop ? bannerHeight : 0,
                bottom: !isConnected && !showAtTop ? bannerHeight : 0,
              ),
              child: child,
            ),
            if (!isConnected)
              Positioned(
                top: showAtTop ?  0 : null,
                bottom: showAtTop ? null : 0,
                left: 0,
                right: 0,
                child: Container(
                  height: bannerHeight,
                  alignment: bannerAlignment,
                  color: bannerColor,
                  padding: bannerPadding,
                  child: Text(
                    bannerMessage,
                    style: bannerTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}