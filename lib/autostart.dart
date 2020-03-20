import 'dart:async';

import 'package:flutter/services.dart';

class Autostart {
  static const MethodChannel _channel = const MethodChannel('autostart');

  ///get isAutoStartPermissionAvailable
  static Future<bool> get isAutoStartPermissionAvailable async {
    final bool isAutoStartAvailable = await _channel.invokeMethod('isAutoStartPermissionAvailable');
    return isAutoStartAvailable;
  }

  ///to auto start manager page
  static void getAutoStartPermission() {
    _channel.invokeMethod('getAutoStartPermission');
  }
}
