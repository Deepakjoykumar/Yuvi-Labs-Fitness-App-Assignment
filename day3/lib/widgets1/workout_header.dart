import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class WorkoutHeader extends StatelessWidget {
  final WorkoutSession workout;

  const WorkoutHeader({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top action buttons row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/icon4.png',
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/icons/icon5.png',
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.more_horiz, size: 24, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Workout info row
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFB8E0E8),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                'assets/icons/icon6.png',
                width: 40,
                height: 40,
                color: const Color(0xFF5A9BA8),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    workout.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${workout.durationMinutes} min',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.0,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: WeeklyProgressChart(progress: workout.weeklyProgress),
            ),
          ],
        ),
      ],
    );
  }
}

class WeeklyProgressChart extends StatelessWidget {
  final List<int> progress;

  const WeeklyProgressChart({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: progress.asMap().entries.map((entry) {
        final isHighlighted = entry.key == 5;
        return Container(
          width: 5,
          height: entry.value * 5.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          decoration: BoxDecoration(
            color: isHighlighted ? const Color(0xFFA8D55E) : Colors.black,
            borderRadius: BorderRadius.circular(2.5),
          ),
        );
      }).toList(),
    );
  }
}