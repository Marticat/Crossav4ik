import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_provider.dart';
import '../widgets/workout_card.dart';
import '../widgets/filter_chip_group.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Workouts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _showDatePicker(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterChipGroup(),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.filteredWorkouts.isEmpty) {
                  return const Center(child: Text('No workouts scheduled'));
                }

                return ListView.builder(
                  itemCount: provider.filteredWorkouts.length,
                  itemBuilder: (context, index) {
                    final workout = provider.filteredWorkouts[index];
                    return WorkoutCard(workout: workout);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewWorkout(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    // TODO: Implement date picker
  }

  void _addNewWorkout(BuildContext context) {
    // TODO: Navigate to workout creation screen
  }
}
