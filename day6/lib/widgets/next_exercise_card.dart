import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import 'circular_progress_widget.dart';

class ExerciseCard extends StatelessWidget {
  final WorkoutSession workout;

  const ExerciseCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // shadow color
            blurRadius: 10,        // how soft the shadow is
            spreadRadius: 2,       // how far the shadow spreads
            offset: const Offset(0, 4), // horizontal & vertical offset
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 0),
          _buildProgressWidget(),
          const SizedBox(height: 0),
          _buildStatsRow(),
          const SizedBox(height: 5),
          _buildStopButton(),

        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildExerciseCounter(),
        _buildDuration(),
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
          child: Text(
            '${workout.currentExercise}/${workout.totalExercises}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDuration() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8), // background color
        borderRadius: BorderRadius.circular(30), // rounded corners
      ),
     child: Text(
      workout.duration,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
      ),
    );
  }

  Widget _buildProgressWidget() {
    return CircularProgressWidget(
      exerciseType: workout.currentExerciseType,
      distance: workout.currentDistance,
      progress: workout.currentProgress,
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildVo2Stat(),
        _buildPageIndicator(),
        _buildHeartRateStat(),
      ],
    );
  }

  Widget _buildVo2Stat() {
    return Row(
      children: [
        const Text(
          'VO₂',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),

        Text(
          workout.vo2.toInt().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      children: [
        _buildIndicatorDot(isActive: false),
        const SizedBox(width: 4),
        _buildIndicatorBar(),
        const SizedBox(width: 4),
        _buildIndicatorDot(isActive: false),
      ],
    );
  }

  Widget _buildIndicatorDot({required bool isActive}) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildIndicatorBar() {
    return Container(
      width: 20,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildHeartRateStat() {
    return Row(
      children: [
        const Icon(Icons.favorite, color: Color(0xFFE6A8A1), size: 24),
        const SizedBox(width: 8),
        Text(
          workout.heartRate.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStopButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFDC9BB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.stop_circle_outlined, size: 24),
          SizedBox(width: 8),
          Text(
            'STOP',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}