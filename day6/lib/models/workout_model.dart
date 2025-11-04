class Exercise {
  final String name;
  final int sets;
  final int completedSets;
  final int timeMinutes;
  final String icon;
  final int percentage;

  Exercise({
    required this.name,
    required this.sets,
    required this.completedSets,
    required this.timeMinutes,
    required this.icon,
    required this.percentage,
  });
}

class WorkoutSession {
  final String title;
  final int durationMinutes;
  final List<int> weeklyProgress;
  final int currentExercise;
  final int totalExercises;
  final String duration;
  final double vo2;
  final int heartRate;
  final String currentExerciseType;
  final String currentDistance;
  final double currentProgress;
  final List<Exercise> exercises;

  WorkoutSession({
    required this.title,
    required this.durationMinutes,
    required this.weeklyProgress,
    required this.currentExercise,
    required this.totalExercises,
    required this.duration,
    required this.vo2,
    required this.heartRate,
    required this.currentExerciseType,
    required this.currentDistance,
    required this.currentProgress,
    required this.exercises,
  });
}