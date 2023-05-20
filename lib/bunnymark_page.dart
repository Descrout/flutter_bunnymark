import 'dart:math';

import 'package:bunnymark_fl/bunny.dart';
import 'package:bunnymark_fl/bunnymark_painter.dart';
import 'package:bunnymark_fl/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';

class BunnyMarkPage extends StatefulWidget {
  const BunnyMarkPage({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<BunnyMarkPage> createState() => _BunnyMarkPageState();
}

class _BunnyMarkPageState extends State<BunnyMarkPage>
    with SingleTickerProviderStateMixin {
  ui.Image? bunnyImages;
  Ticker? ticker;
  final bunnies = <Bunny>[];

  @override
  void initState() {
    Helpers.loadImageFromAssets("assets/lineup.png").then((value) {
      bunnyImages = value;
      setState(() {});

      ticker?.dispose();
      ticker = createTicker(tick);
      ticker!.start();
    });

    super.initState();
  }

  @override
  void dispose() {
    ticker?.dispose();
    super.dispose();
  }

  void tick(Duration elapsed) {
    for (final bunny in bunnies) {
      bunny.update(widget.width, widget.height);
    }
    setState(() {});
  }

  void onDown(DragUpdateDetails event) {
    final bunniesToAdd = List.generate(
      5,
      (index) => Bunny(
        x: event.globalPosition.dx,
        y: event.globalPosition.dy,
        rotation: Random().nextDouble() * pi,
      ),
      growable: false,
    );

    bunnies.addAll(bunniesToAdd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: bunnyImages == null
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onPanUpdate: onDown,
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: BunnyMarkPainter(
                    spriteSheet: bunnyImages!,
                    bunnies: bunnies,
                  ),
                  isComplex: true,
                  child: const SizedBox.expand(),
                ),
              ),
            ),
    );
  }
}
