import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _LogoPainter()),
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle with gradient
    final bgPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.primary.withValues(alpha: 0.3),
          AppColors.background,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, bgPaint);

    // Outer ring
    final ringPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03;
    canvas.drawCircle(center, radius * 0.92, ringPaint);

    // Water drop shape
    _drawWaterDrop(canvas, center, radius);

    // Sparkle effects around the drop
    _drawSparkles(canvas, center, radius);

    // "AI" text in the center
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'AI',
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.18,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2 + radius * 0.08,
      ),
    );
  }

  void _drawWaterDrop(Canvas canvas, Offset center, double radius) {
    final dropPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.accent,
          AppColors.primary,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 0.6));

    final path = Path();
    final dropCenter = Offset(center.dx, center.dy + radius * 0.05);
    final dropRadius = radius * 0.55;

    // Top point of drop
    path.moveTo(dropCenter.dx, dropCenter.dy - dropRadius * 1.1);

    // Right curve
    path.cubicTo(
      dropCenter.dx + dropRadius * 0.15,
      dropCenter.dy - dropRadius * 0.7,
      dropCenter.dx + dropRadius * 0.85,
      dropCenter.dy - dropRadius * 0.15,
      dropCenter.dx + dropRadius * 0.65,
      dropCenter.dy + dropRadius * 0.35,
    );

    // Bottom curve
    path.cubicTo(
      dropCenter.dx + dropRadius * 0.5,
      dropCenter.dy + dropRadius * 0.7,
      dropCenter.dx + dropRadius * 0.15,
      dropCenter.dy + dropRadius * 0.85,
      dropCenter.dx,
      dropCenter.dy + dropRadius * 0.85,
    );

    // Left bottom curve
    path.cubicTo(
      dropCenter.dx - dropRadius * 0.15,
      dropCenter.dy + dropRadius * 0.85,
      dropCenter.dx - dropRadius * 0.5,
      dropCenter.dy + dropRadius * 0.7,
      dropCenter.dx - dropRadius * 0.65,
      dropCenter.dy + dropRadius * 0.35,
    );

    // Left top curve back to top
    path.cubicTo(
      dropCenter.dx - dropRadius * 0.85,
      dropCenter.dy - dropRadius * 0.15,
      dropCenter.dx - dropRadius * 0.15,
      dropCenter.dy - dropRadius * 0.7,
      dropCenter.dx,
      dropCenter.dy - dropRadius * 1.1,
    );

    path.close();
    canvas.drawPath(path, dropPaint);

    // Highlight on drop
    final highlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3);
    canvas.drawCircle(
      Offset(center.dx - radius * 0.12, center.dy - radius * 0.1),
      radius * 0.08,
      highlightPaint,
    );
  }

  void _drawSparkles(Canvas canvas, Offset center, double radius) {
    final sparklePaint = Paint()
      ..color = AppColors.accent
      ..style = PaintingStyle.fill;

    const sparkleCount = 6;
    final sparkleRadius = radius * 0.04;
    final sparkleOrbit = radius * 0.82;

    for (int i = 0; i < sparkleCount; i++) {
      final angle = (2 * math.pi / sparkleCount) * i - math.pi / 6;
      final x = center.dx + sparkleOrbit * math.cos(angle);
      final y = center.dy + sparkleOrbit * math.sin(angle);

      // Four-point star
      final starPath = Path();
      final starSize = sparkleRadius * (1.0 + (i % 2) * 0.5);

      starPath.moveTo(x, y - starSize);
      starPath.lineTo(x + starSize * 0.3, y);
      starPath.lineTo(x, y + starSize);
      starPath.lineTo(x - starSize * 0.3, y);
      starPath.close();

      starPath.moveTo(x - starSize, y);
      starPath.lineTo(x, y + starSize * 0.3);
      starPath.lineTo(x + starSize, y);
      starPath.lineTo(x, y - starSize * 0.3);
      starPath.close();

      canvas.drawPath(starPath, sparklePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
