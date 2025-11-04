import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import '../widgets/workout_header.dart';
import '../widgets/exercise_card.dart';
import '../widgets/next_exercise_card.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late WorkoutSession workout;

  @override
  void initState() {
    super.initState();
    workout = WorkoutSession(
      title: 'Workout',
      durationMinutes: 90,
      weeklyProgress: [3, 5, 2, 6, 4, 7, 5],
      currentExercise: 1,
      totalExercises: 8,
      duration: '1:29:59',
      vo2: 29,
      heartRate: 98,
      currentExerciseType: 'Running',
      currentDistance: '10km',
      currentProgress: 0.35,
      exercises: [
        Exercise(
          name: 'Bench Press',
          sets: 10,
          completedSets: 3,
          timeMinutes: 4,
          icon: '💪',
          percentage: 6,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D9DD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                WorkoutHeader(workout: workout),
                const SizedBox(height: 16),
                ExerciseCard(workout: workout),
                const SizedBox(height: 16),
                NextExerciseCard(exercise: workout.exercises[0]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}