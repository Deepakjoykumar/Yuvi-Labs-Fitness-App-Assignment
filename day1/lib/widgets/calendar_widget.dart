import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          // Month selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back, size: 32, color: Colors.black87, weight: 2.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFCCBC),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Text(
                    'Feb 2025',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward, size: 32, color: Colors.black87, weight: 2.0),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Week days and dates combined with Stack for WED/4 connection
          LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final itemWidth = totalWidth / 7;
              return Stack(
                children: [
                  // Circle for 1
                  Positioned(
                    left: itemWidth * 0.5 - 19,
                    top: 55,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCCBC),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Circle for 2
                  Positioned(
                    left: itemWidth * 1.5 - 19,
                    top: 55,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCCBC),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Connected WED and 4 pill
                  Positioned(
                    left: itemWidth * 3.5 - 25,
                    top: 4,
                    child: Container(
                      width: 50,
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFCCBC),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  // Week days and dates
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeekDay('SUN', 0),
                          _buildWeekDay('MON', 1),
                          _buildWeekDay('TUE', 2),
                          _buildWeekDay('WED', 3),
                          _buildWeekDay('THR', 4),
                          _buildWeekDay('FRI', 5),
                          _buildWeekDay('SAT', 6),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildDate('1', 0),
                          _buildDate('2', 1),
                          _buildDate('3', 2),
                          _buildDate('4', 3),
                          _buildDate('5', 4),
                          _buildDate('6', 5),
                          _buildDate('7', 6),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDay(String day, int index) {
    return Container(
      width: 44,
      height: 48,
      alignment: Alignment.center,
      child: Text(
        day,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDate(String date, int index) {
    return Container(
      width: 44,
      height: 52,
      alignment: Alignment.center,
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}