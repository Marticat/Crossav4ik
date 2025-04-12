import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../statistics_provider.dart';
import '../widgets/progress_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Progress'),
      ),
      body: Consumer<StatisticsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const ProgressChart(
                  title: 'Workouts per Week',
                  isWeekly: true,
                ),
                const SizedBox(height: 24),
                const ProgressChart(
                  title: 'Calories Burned',
                  isWeekly: false,
                ),
                const SizedBox(height: 24),
                const ProgressChart(
                  title: 'Weight Progress',
                  isWeekly: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}