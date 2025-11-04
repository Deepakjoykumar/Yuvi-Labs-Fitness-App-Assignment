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
      title: _getAppTitle(),
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: _buildHomeScreen(),
    );
  }

  String _getAppTitle() {
    return 'Workout Tracker';
  }

  ThemeData _buildTheme() {
    return ThemeData(
      fontFamily: _getFontFamily(),
      primarySwatch: _getPrimaryColor(),
      scaffoldBackgroundColor: _getBackgroundColor(),
    );
  }

  String _getFontFamily() {
    return 'SF Pro Text';
  }

  MaterialColor _getPrimaryColor() {
    return Colors.blue;
  }

  Color _getBackgroundColor() {
    return const Color(0xFFE5E5E5);
  }

  Widget _buildHomeScreen() {
    return const WorkoutScreen();
  }
}