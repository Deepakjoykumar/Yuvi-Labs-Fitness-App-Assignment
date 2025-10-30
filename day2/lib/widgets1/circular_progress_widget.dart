import 'package:flutter/material.dart';

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
      width: 240,
      height: 240,
      child: CustomPaint(
        painter: CircularProgressPainter(progress: progress),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                exerciseType,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                distance,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
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

    // Outer background circle (light gray)
    final bgPaint1 = Paint()
      ..color = const Color(0xFFF0F0F0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    canvas.drawCircle(center, radius - 20, bgPaint1);

    // Inner background circle (lighter gray)
    final bgPaint2 = Paint()
      ..color = const Color(0xFFF5F5F5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    canvas.drawCircle(center, radius - 42, bgPaint2);

    // Outer circle progress - light blue 25% on left side
    final outerProgressPaint = Paint()
      ..color = const Color(0xFFABD9E5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    // Draw 25% (0% to 25%) on left side anticlockwise from top
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 20),
      -3.14 / 2, // Start at top (-90 degrees)
      -3.14 * 0.5, // 25% anticlockwise
      false,
      outerProgressPaint,
    );

    // Inner circle progress - 65% light blue anticlockwise
    final innerProgressPaint = Paint()
      ..color = const Color(0xFFABD9E5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    // Draw 65% anticlockwise starting from top
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 42),
      -3.14 / 2, // Start at top (-90 degrees)
      -3.14 * 1.3, // 65% anticlockwise (negative for anticlockwise)
      false,
      innerProgressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}