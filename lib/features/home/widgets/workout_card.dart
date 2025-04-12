import 'package:flutter/material.dart';
import '../../../models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => _navigateToDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    workout.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Chip(
                    label: Text(workout.difficultyText),
                    // Replace with:
                    backgroundColor: workout.difficultyColor.withAlpha(51),  // 20% opacity equivalent
                    labelStyle: TextStyle(
                      color: workout.difficultyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(workout.description),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text('${workout.duration} min'),
                  const SizedBox(width: 16),
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text('${workout.date.day}/${workout.date.month}/${workout.date.year}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.pushNamed(context, '/workout/${workout.id}');
  }
}