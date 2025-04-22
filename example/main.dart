import 'package:flutter/material.dart';
import 'package:connectivity_banner/connectivity_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectivityBanner(
        onConnected: () => debugPrint("Connected"),
        child: Scaffold(
          appBar: AppBar(title: const Text('Connectivity Banner Example')),
          body: const Center(child: Text('Hello World')),
        ),
      ),
    );
  }
}