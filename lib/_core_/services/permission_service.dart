import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MonitoringChannel {
  static const MethodChannel _channel = MethodChannel('com.joseph.monitoring');

  static Future<bool> hasCameraPermission() async {
    try {
      final bool result =
          await _channel.invokeMethod("getCameraPermissionStatus");
      return result;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> requestCameraPermission() async {
    try {
      final bool result =
          await _channel.invokeMethod("requestCameraPermission");
      return result;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> hasScreenCapturePermission() async {
    try {
      final bool result =
          await _channel.invokeMethod("hasScreenCapturePermission");
      return result;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<Uint8List?> captureScreen() async {
    final folderName = await getApplicationDocumentsDirectory();
    try {
      final result = await _channel.invokeMethod<Uint8List>("takeScreenShot", folderName.path);
      return result;
    } on PlatformException catch (e) {
      print(e);
      return null;
    }
  }
}
