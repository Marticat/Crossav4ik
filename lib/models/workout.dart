import 'package:flutter/material.dart';
import 'exercise.dart';

enum Difficulty { beginner, intermediate, advanced }

class Workout {
  final String id;
  final String title;
  final String description;
  final Difficulty difficulty;
  final DateTime date;
  final int duration; // in minutes
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.date,
    required this.duration,
    required this.exercises,
  });

  String get difficultyText {
    switch (difficulty) {
      case Difficulty.beginner:
        return 'Beginner';
      case Difficulty.intermediate:
        return 'Intermediate';
      case Difficulty.advanced:
        return 'Advanced';
    }
  }

  Color get difficultyColor {
    switch (difficulty) {
      case Difficulty.beginner:
        return Colors.green;
      case Difficulty.intermediate:
        return Colors.orange;
      case Difficulty.advanced:
        return Colors.red;
    }
  }
}