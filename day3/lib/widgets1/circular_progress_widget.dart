import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularProgressWidget extends StatelessWidget {
  final String exerciseType;
  final String distance;
  final double progress;

  const CircularProgressWidget({
    Key? key,
    required this.exerciseType,
    required this.distance,
    required this.progress,
  }) : super(key: key);

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
                  color: Colors.white,
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

  CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    const strokeWidth = 12.0;

    // Outermost background circle - with 15% gap (top-right), 25% gap (top-left), and 10% gap (bottom center)
    final bgPaint1 = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw first segment: from top + 15% gap to bottom - 5% (before bottom gap)
    final startAngle1 = -math.pi / 2 + (2 * math.pi * 0.10);
    final sweepAngle1 = 2 * math.pi * 0; // 30% of circle outer circle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 15),
      startAngle1,
      sweepAngle1,
      false,
      bgPaint1,
    );

    // Draw second segment: from bottom + 5% (after bottom gap) to top - 25% gap
    final startAngle2 = math.pi / 2 + (2 * math.pi * 0.04);
    final sweepAngle2 = 2 * math.pi * 0.20; // 30% of circle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 30),
      startAngle2,
      sweepAngle2,
      false,
      bgPaint1,
    );

    // Middle background circle - FULL 360° circle
    final bgPaint2 = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - 50, bgPaint2);

    // Inner background circle - FULL 360° circle
    final bgPaint3 = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - 65, bgPaint3);

    // Inner circle progress - 65% light blue anticlockwise
    final innerProgressPaint = Paint()
      ..color = const Color(0xFFADD8E6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw 65% anticlockwise from top
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 65),
      -math.pi / 2, // Start at top (-90 degrees)
      -2 * math.pi * 0.65, // 65% anticlockwise
      false,
      innerProgressPaint,
    );

    // Outermost circle with gradient progress
    final rect = Rect.fromCircle(center: center, radius: radius - 30);

    // Calculate arc sweep angle
    final arcStartAngle = -math.pi * 0.080;
    final arcSweepAngle = math.pi * 1.5 * (progress * 0.75);

    final gradient = SweepGradient(
      startAngle: arcStartAngle,
      endAngle: arcStartAngle + arcSweepAngle,
      colors: const [
        Color(0xFF66BB6A), // Green at start (top)
        Color(0xFF9CCC65), // Light green
        Color(0xFFFFEB3B), // Yellow
        Color(0xFFFF9800), // Orange at end (bottom)
      ],
    );

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

    // Calculate the start position of the outer progress arc (beginning)
    final startAngle = -math.pi * 0.090;
    final dotX = center.dx + (radius - 30) * math.cos(startAngle);
    final dotY = center.dy + (radius - 48) * math.sin(startAngle);
    final dotPosition = Offset(dotX, dotY);

    // Draw green dot at the beginning of the progress
    final dotPaint = Paint()
      ..color = const Color(0xFF66BB6A) // Green color matching the gradient start
      ..style = PaintingStyle.fill;

    canvas.drawCircle(dotPosition, 8, dotPaint);

    // Add white border to the dot for better visibility
    final dotBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(dotPosition, 8, dotBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}