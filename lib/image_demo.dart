
import 'dart:async';

import 'package:flutter/services.dart';

class ImageDemo {
  static const MethodChannel _channel = MethodChannel('image_demo');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
