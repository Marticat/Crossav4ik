import 'package:flutter/material.dart';
import '../../models/workout.dart';

class HomeProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  Difficulty? _selectedDifficulty;
  DateTime? _selectedDate;

  List<Workout> get filteredWorkouts {
    return _workouts.where((workout) {
      final matchesDifficulty = _selectedDifficulty == null ||
          workout.difficulty == _selectedDifficulty;
      final matchesDate = _selectedDate == null ||
          workout.date.year == _selectedDate!.year &&
              workout.date.month == _selectedDate!.month &&
              workout.date.day == _selectedDate!.day;
      return matchesDifficulty && matchesDate;
    }).toList();
  }

  bool get isLoading => _workouts.isEmpty;

  Difficulty? get selectedDifficulty => _selectedDifficulty;
  DateTime? get selectedDate => _selectedDate;

  void setDifficultyFilter(Difficulty? difficulty) {
    _selectedDifficulty = difficulty;
    notifyListeners();
  }

  void setDateFilter(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  // In a real app, this would fetch from a service
  Future<void> loadWorkouts() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    _workouts = [
      // Sample data
      Workout(
        id: '1',
        title: 'Full Body Workout',
        description: 'Complete full body routine focusing on compound movements',
        difficulty: Difficulty.intermediate,
        date: DateTime.now().add(const Duration(days: 1)),
        duration: 45,
        exercises: [],
      ),
      // Add more sample workouts
    ];

    notifyListeners();
  }
}