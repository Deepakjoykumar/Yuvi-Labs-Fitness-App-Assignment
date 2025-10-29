import 'package:flutter/material.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/stats_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/image1.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Sophia',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/icon1.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF3B30),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Calendar Widget
                const CalendarWidget(),
                const SizedBox(height: 24),

                // Stats Grid
                const StatsGrid(),
                const SizedBox(height: 24),

                // Weekly Points Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(0, 0, 0, 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Header row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Circular progress
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              children: [
                                // Background circle
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: CircularProgressIndicator(
                                    value: 1.0,
                                    strokeWidth: 10,
                                    backgroundColor: const Color(0xFFE8EAED),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFFE8EAED),
                                    ),
                                  ),
                                ),
                                // Progress circle with gap
                                Transform.rotate(
                                  angle: 2.35619, // Start position with gap
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CircularProgressIndicator(
                                      value: 0.58, // Adjusted for visual gap
                                      strokeWidth: 10,
                                      strokeCap: StrokeCap.round,
                                      backgroundColor: Colors.transparent,
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                        Color(0xFF8BC34A),
                                      ),
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    '64%',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Weekly points and number
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Weekly points',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text(
                                      '1544',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE8F5E9),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomPaint(
                                            size: const Size(10, 10),
                                            painter: TrianglePainter(
                                              color: Colors.green[700]!,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            '6%',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.grey[600],
                            size: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Gray card for graph
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120,
                              child: CustomPaint(
                                size: const Size(double.infinity, 120),
                                painter: ChartPainter(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                                    .map(
                                      (d) => Text(
                                    d,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Triangle painter (for arrow)
class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Chart painter with dotted grid lines
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color.fromRGBO(158, 158, 158, 0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw vertical dotted lines
    const dashWidth = 2;
    const dashSpace = 4;
    final stepX = size.width / 6;
    for (int i = 0; i < 7; i++) {
      final x = i * stepX;
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(
          Offset(x, startY),
          Offset(x, startY + dashWidth),
          gridPaint,
        );
        startY += dashWidth + dashSpace;
      }
    }

    // Draw blue graph line
    final paint = Paint()
      ..color = const Color(0xFF5BA8C8)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final points = [
      Offset(0, size.height * 0.55),
      Offset(size.width * 0.15, size.height * 0.50),
      Offset(size.width * 0.30, size.height * 0.60),
      Offset(size.width * 0.45, size.height * 0.40),
      Offset(size.width * 0.60, size.height * 0.25),
      Offset(size.width * 0.75, size.height * 0.45),
      Offset(size.width, size.height * 0.40),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      final p0 = points[i - 1];
      final p1 = points[i];
      final cpx = (p0.dx + p1.dx) / 2;
      path.quadraticBezierTo(cpx, p0.dy, p1.dx, p1.dy);
    }

    canvas.drawPath(path, paint);

    // Highlight dot with white outer ring (Friday)
    final outerRingPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(points[5], 8, outerRingPaint);

    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(points[5], 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}
