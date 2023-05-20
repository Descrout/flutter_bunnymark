import 'dart:math';
import 'dart:ui';

class Bunny {
  final Rect frame;

  RSTransform transform;
  double x;
  double y;
  double vx;
  double vy;

  double rotation;

  Bunny({
    required this.x,
    required this.y,
    required this.rotation,
  })  : frame = Rect.fromLTWH(36.0 * Random().nextInt(12), 0, 36, 36),
        transform = RSTransform.fromComponents(
          rotation: rotation,
          scale: 1.0,
          anchorX: 18,
          anchorY: 18,
          translateX: x,
          translateY: y,
        ),
        vx = (Random().nextDouble() * 2 - 1) * 1.5,
        vy = (Random().nextDouble() * 2 - 1) * 1.5;

  void update(double width, double height) {
    x += vx;
    y += vy;

    if (x + 18 > width) {
      x = width - 18;
      vx = vx.abs() * -1;
    } else if (x - 18 < 0) {
      x = 18;
      vx = vx.abs();
    }

    if (y + 18 > height) {
      y = height - 18;
      vy = vy.abs() * -1;
    } else if (y - 18 < 0) {
      y = 18;
      vy = vy.abs();
    }

    rotation += vx.sign * 0.01;

    transform = RSTransform.fromComponents(
      rotation: rotation,
      scale: 1.0,
      anchorX: 18,
      anchorY: 18,
      translateX: x,
      translateY: y,
    );
  }
}
