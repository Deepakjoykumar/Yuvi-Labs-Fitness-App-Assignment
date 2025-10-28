import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Month selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios, size: 18, color: Colors.grey[700]),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFCDD2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Feb 2025',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[700]),
            ],
          ),
          const SizedBox(height: 20),

          // Week days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeekDay('SUN'),
              _buildWeekDay('MON'),
              _buildWeekDay('TUE'),
              _buildWeekDay('WED'),
              _buildWeekDay('THR'),
              _buildWeekDay('FRI'),
              _buildWeekDay('SAT'),
            ],
          ),
          const SizedBox(height: 16),

          // Dates
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDate('1', isHighlighted: true),
              _buildDate('2', isHighlighted: true),
              _buildDate('3', isHighlighted: false),
              _buildDate('4', isHighlighted: true),
              _buildDate('5', isHighlighted: false),
              _buildDate('6', isHighlighted: false),
              _buildDate('7', isHighlighted: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDay(String day) {
    return SizedBox(
      width: 40,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDate(String date, {required bool isHighlighted}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFFFCDD2) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}