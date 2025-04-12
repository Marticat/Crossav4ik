import 'package:flutter/material.dart';
import '../../models/workout.dart';
import '../../models/exercise.dart';  // Make sure this import exists

class WorkoutDetailsProvider with ChangeNotifier {
  Workout? _workout;
  bool _isLoading = false;

  Workout? get workout => _workout;
  bool get isLoading => _isLoading;

  Future<void> loadWorkout(String id) async {
    _isLoading = true;
    notifyListeners();

    // Simulate network request
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, this would fetch from a service
    _workout = Workout(
      id: id,
      title: 'Full Body Workout',
      description: 'Complete full body routine focusing on compound movements',
      difficulty: Difficulty.intermediate,
      date: DateTime.now().add(const Duration(days: 1)),
      duration: 45,
      exercises: [
        Exercise(
          id: '1',
          name: 'Squats',
          description: 'Stand with feet shoulder-width apart...',
          imageUrl: '',
          sets: 3,
          reps: 12,
          restTime: 60,
        ),
        Exercise(
          id: '2',
          name: 'Push-ups',
          description: 'Keep your body straight while lowering...',
          imageUrl: '',
          sets: 3,
          reps: 10,
          restTime: 45,
        ),
        Exercise(
          id: '3',
          name: 'Lunges',
          description: 'Step forward with one leg and lower your hips...',
          imageUrl: '',
          sets: 3,
          reps: 10,
          restTime: 60,
        ),
      ],
    );

    _isLoading = false;
    notifyListeners();
  }
}