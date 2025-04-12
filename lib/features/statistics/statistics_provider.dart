import 'package:flutter/material.dart';
import '../../models/user_stats.dart';

class StatisticsProvider with ChangeNotifier {
  List<UserStats> _stats = [];
  bool _isLoading = false;

  List<UserStats> get stats => _stats;
  bool get isLoading => _isLoading;

  Future<void> loadStats() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network request
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, this would fetch from a service
    _stats = [
      UserStats(
        date: DateTime.now().subtract(const Duration(days: 30)),
        weight: 75.5,
        caloriesBurned: 2500,
        workoutDuration: 45,
      ),
      // Add more stats
    ];

    _isLoading = false;
    notifyListeners();
  }
}