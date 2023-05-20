import 'dart:ui' as ui;

import 'package:bunnymark_fl/bunny.dart';
import 'package:flutter/material.dart';

class BunnyMarkPainter extends CustomPainter {
  BunnyMarkPainter({required this.bunnies, required this.spriteSheet});

  final ui.Image spriteSheet;
  final List<Bunny> bunnies;

  @override
  void paint(Canvas canvas, Size size) {
    final transforms = <RSTransform>[];
    final rects = <Rect>[];

    for (final bunny in bunnies) {
      transforms.add(bunny.transform);
      rects.add(bunny.frame);
    }

    canvas.drawAtlas(
      spriteSheet,
      transforms,
      rects,
      null,
      BlendMode.color,
      null,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
