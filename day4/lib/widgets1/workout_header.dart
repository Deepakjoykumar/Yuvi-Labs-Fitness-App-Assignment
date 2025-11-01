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
                      // fontFamily: 'SF Pro Text',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${workout.durationMinutes} min',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      height: 1.0,
                      letterSpacing: -0.5,
                      // fontFamily: 'SF Pro Text',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
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
        final index = entry.key;
        final isGreen = index == 3 || index == 4;

        double barHeight;
        if (index == 1 || index == 2) {
          barHeight = progress[1] * 8.0;
        } else if (index == 5) {
          barHeight = progress[4] * 9.0;
        } else if (index == 6) {
          barHeight = (progress[4] * 9.0) + 15.0;
        } else {
          barHeight = entry.value * 9.0;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isGreen)
              Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  color: Color(0xFFA8D55E),
                  shape: BoxShape.circle,
                ),
              ),
            Container(
              width: 5,
              height: barHeight,
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              decoration: BoxDecoration(
                color: isGreen ? const Color(0xFFA8D55E) : Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}