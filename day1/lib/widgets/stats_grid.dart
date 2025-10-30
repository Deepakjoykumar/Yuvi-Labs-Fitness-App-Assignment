import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFB3E5FC),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(

                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/icon2.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  '1:30',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Hours',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFDCEDC8),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Exercises',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        // color: const Color(0xFF9CCC65),
                        // shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/icon3.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  '12/8',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}