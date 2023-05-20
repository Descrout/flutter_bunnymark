import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class Helpers {
  static Future<ui.Image?> loadImageFromBytes(Uint8List bytes) async {
    try {
      final codec = await ui.instantiateImageCodec(bytes);
      var frame = await codec.getNextFrame();
      return frame.image;
    } catch (_) {
      debugPrint("loadImageFromBytes error : $_");
      return null;
    }
  }

  static Future<ui.Image?> loadImageFromAssets(String imageAssetPath) async {
    try {
      final ByteData data = await rootBundle.load(imageAssetPath);
      return loadImageFromBytes(data.buffer.asUint8List());
    } catch (_) {
      debugPrint("loadImageFromAssets error : $_");
      return null;
    }
  }
}
