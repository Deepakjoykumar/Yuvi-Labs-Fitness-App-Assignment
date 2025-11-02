import 'package:flutter/material.dart';
import 'screens/workout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Text',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),

      ),
      home: const WorkoutScreen(),
    );
  }
}