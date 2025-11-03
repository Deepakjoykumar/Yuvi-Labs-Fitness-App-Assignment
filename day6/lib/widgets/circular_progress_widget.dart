import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularProgressWidget extends StatelessWidget {
  final String exerciseType;
  final String distance;
  final double progress;

  const CircularProgressWidget({
    super.key,
    required this.exerciseType,
    required this.distance,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: CircularProgressPainter(progress: progress),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.directions_run,
                  color: Color(0xFFFDC9BB),
                  size: 25,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                exerciseType,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                distance,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  static const double strokeWidth = 12.0;

  CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    _drawBackgroundCircles(canvas, center, radius);
    _drawInnerProgress(canvas, center, radius);
    _drawOuterProgress(canvas, center, radius);
    _drawProgressStartDot(canvas, center, radius);
  }

  void _drawBackgroundCircles(Canvas canvas, Offset center, double radius) {
    final bgPaint = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    _drawFirstBackgroundSegment(canvas, center, radius, bgPaint);
    _drawSecondBackgroundSegment(canvas, center, radius, bgPaint);
    _drawMiddleBackgroundCircle(canvas, center, radius);
    _drawInnerBackgroundCircle(canvas, center, radius);
  }

  void _drawFirstBackgroundSegment(
      Canvas canvas,
      Offset center,
      double radius,
      Paint paint,
      ) {
    final startAngle = -math.pi / 2 + (2 * math.pi * 0.10);
    final sweepAngle = 2 * math.pi * 0;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 15),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  void _drawSecondBackgroundSegment(
      Canvas canvas,
      Offset center,
      double radius,
      Paint paint,
      ) {
    final startAngle = math.pi / 2 + (3 * math.pi * 0.04);
    final sweepAngle = 2 * math.pi * 0.23;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 30),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  void _drawMiddleBackgroundCircle(Canvas canvas, Offset center, double radius) {
    final bgPaint = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - 50, bgPaint);
  }

  void _drawInnerBackgroundCircle(Canvas canvas, Offset center, double radius) {
    final bgPaint = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - 65, bgPaint);
  }

  void _drawInnerProgress(Canvas canvas, Offset center, double radius) {
    final innerProgressPaint = Paint()
      ..color = const Color(0xFFADD8E6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 65),
      -math.pi / 2,
      -2 * math.pi * 0.65,
      false,
      innerProgressPaint,
    );
  }

  void _drawOuterProgress(Canvas canvas, Offset center, double radius) {
    final rect = Rect.fromCircle(center: center, radius: radius - 30);
    final arcStartAngle = math.pi / 80;
    final arcSweepAngle = math.pi * 1.5 * (progress * 0.60);

    final gradient = _createProgressGradient(arcStartAngle, arcSweepAngle);
    final outerProgressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      arcStartAngle,
      arcSweepAngle,
      false,
      outerProgressPaint,
    );
  }

  SweepGradient _createProgressGradient(double startAngle, double sweepAngle) {
    return SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: const [
        Color(0xFF66BB6A),
        Color(0xFF9CCC65),
        Color(0xFFCDAC3F),
        Color(0xFFFF9800),
      ],
    );
  }

  void _drawProgressStartDot(Canvas canvas, Offset center, double radius) {
    final dotPosition = _calculateDotPosition(center, radius);
    _drawDotFill(canvas, dotPosition);
    _drawDotBorder(canvas, dotPosition);
  }

  Offset _calculateDotPosition(Offset center, double radius) {
    final startAngle = -math.pi * 0.020;
    final dotX = center.dx + (radius - 30) * math.cos(startAngle);
    final dotY = center.dy + (radius - 48) * math.sin(startAngle);
    return Offset(dotX, dotY);
  }

  void _drawDotFill(Canvas canvas, Offset position) {
    final dotPaint = Paint()
      ..color = const Color(0xFF66BB6A)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, 8, dotPaint);
  }

  void _drawDotBorder(Canvas canvas, Offset position) {
    final dotBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(position, 8, dotBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}