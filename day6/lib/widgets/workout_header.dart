import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class WorkoutHeader extends StatelessWidget {
  final WorkoutSession workout;

  const WorkoutHeader({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActionButtonsRow(),
        const SizedBox(height: 32),
        _buildWorkoutInfoRow(),
      ],
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBackButton(),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildBackButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildIconAsset('assets/icons/icon4.png'),
          const SizedBox(width: 10),
          _buildIconAsset('assets/icons/icon5.png'),
          const SizedBox(width: 10),
          const Icon(Icons.more_horiz, size: 24, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildIconAsset(String assetPath) {
    return Image.asset(
      assetPath,
      width: 30,
      height: 30,
      color: Colors.black,
    );
  }

  Widget _buildWorkoutInfoRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildWorkoutIcon(),
        const SizedBox(width: 20),
        Expanded(child: _buildWorkoutDetails()),
        const SizedBox(width: 4),
        _buildWeeklyChart(),
      ],
    );
  }

  Widget _buildWorkoutIcon() {
    return Container(
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
    );
  }

  Widget _buildWorkoutDetails() {
    return Column(
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
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.0,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyChart() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: WeeklyProgressChart(progress: workout.weeklyProgress),
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
      children: _buildProgressBars(),
    );
  }

  List<Widget> _buildProgressBars() {
    return progress.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;
      return _buildSingleBar(index, value);
    }).toList();
  }

  Widget _buildSingleBar(int index, int value) {
    final isGreen = _isGreenBar(index);
    final barHeight = _calculateBarHeight(index, value);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isGreen) _buildIndicatorDot(),
        _buildBar(barHeight, isGreen),
      ],
    );
  }

  bool _isGreenBar(int index) {
    return index == 3 || index == 4;
  }

  double _calculateBarHeight(int index, int value) {
    if (index == 1 || index == 2) {
      return progress[1] * 8.0;
    } else if (index == 5) {
      return progress[4] * 9.0;
    } else if (index == 6) {
      return (progress[4] * 9.0) + 15.0;
    } else {
      return value * 9.0;
    }
  }

  Widget _buildIndicatorDot() {
    return Container(
      width: 5,
      height: 5,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
        color: Color(0xFFA8D55E),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBar(double height, bool isGreen) {
    return Container(
      width: 5,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      decoration: BoxDecoration(
        color: isGreen ? const Color(0xFFA8D55E) : Colors.black,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}