import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../workout_details_provider.dart';
import '../widgets/exercise_tile.dart';
import '../widgets/timer_widget.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final String workoutId;

  const WorkoutDetailsScreen({super.key, required this.workoutId});

  @override
  State<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WorkoutDetailsProvider>().loadWorkout(widget.workoutId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Details'),
      ),
      body: Consumer<WorkoutDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.workout == null) {
            return const Center(child: Text('Workout not found'));
          }

          final workout = provider.workout!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workout.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(workout.description),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Chip(
                          label: Text(workout.difficultyText),
                          backgroundColor: workout.difficultyColor.withAlpha((0.2 * 255).toInt()),
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 4),
                        Text('${workout.duration} min'),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: workout.exercises.length,
                  itemBuilder: (context, index) {
                    return ExerciseTile(
                      exercise: workout.exercises[index],
                      index: index,
                    );
                  },
                ),
              ),
              const TimerWidget(),
            ],
          );
        },
      ),
    );
  }
}