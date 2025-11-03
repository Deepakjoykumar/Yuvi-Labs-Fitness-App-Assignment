import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class NextExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const NextExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildExerciseDetails(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildExerciseCounter(),
        const Icon(Icons.more_horiz, size: 24),
      ],
    );
  }

  Widget _buildExerciseCounter() {
    return Row(
      children: [
        const Text(
          'Exercise  ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            '2/8',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseDetails() {
    return Row(
      children: [
        _buildExerciseIcon(),
        const SizedBox(width: 16),
        Expanded(child: _buildExerciseInfo()),
        _buildTimeInfo(),
        const SizedBox(width: 20),
        _buildPlayButton(),
      ],
    );
  }

  Widget _buildExerciseIcon() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD5E8E8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Transform.rotate(
        angle: 80,
        child: const Icon(
          Icons.fitness_center,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildExerciseInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exercise.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        _buildSetsProgress(),
      ],
    );
  }

  Widget _buildSetsProgress() {
    return Row(
      children: [
        Text(
          '${exercise.completedSets}/${exercise.sets}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        _buildPercentageBadge(),
      ],
    );
  }

  Widget _buildPercentageBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_drop_up,
            size: 20,
            color: Color(0xFF4CAF50),
          ),
          Text(
            '${exercise.percentage}%',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${exercise.timeMinutes}min',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 18,
      ),
    );
  }
}