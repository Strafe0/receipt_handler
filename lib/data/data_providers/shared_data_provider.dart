import 'package:flutter/services.dart';

class SharedDataProvider {
  final _platform = const MethodChannel("app.channel.shared.data");

  Future<String?> readContentOfSharedFile() async {
    return await _platform.invokeMethod('getSharedText');
  }
}