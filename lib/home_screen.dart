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
                              image: NetworkImage(
                                'https://i.pravatar.cc/150?img=47',
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
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Sophia',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF5252),
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
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Weekly points',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: CircularProgressIndicator(
                                    value: 0.64,
                                    strokeWidth: 10,
                                    backgroundColor: const Color(0xFFE8EAED),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFF8BC34A),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '64%',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '1544',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    size: 14,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '6%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Chart
                      SizedBox(
                        height: 100,
                        child: CustomPaint(
                          size: const Size(double.infinity, 100),
                          painter: ChartPainter(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('S', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('M', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('T', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('W', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('T', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('F', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          Text('S', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
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

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5B9BD5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final points = [
      Offset(0, size.height * 0.5),
      Offset(size.width * 0.14, size.height * 0.4),
      Offset(size.width * 0.28, size.height * 0.6),
      Offset(size.width * 0.42, size.height * 0.45),
      Offset(size.width * 0.56, size.height * 0.55),
      Offset(size.width * 0.70, size.height * 0.2),
      Offset(size.width * 0.85, size.height * 0.4),
      Offset(size.width, size.height * 0.5),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      final p0 = points[i - 1];
      final p1 = points[i];
      final cp1x = p0.dx + (p1.dx - p0.dx) / 2;
      path.quadraticBezierTo(cp1x, p0.dy, p1.dx, p1.dy);
    }

    canvas.drawPath(path, paint);

    // Draw dot on peak
    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(points[5], 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}