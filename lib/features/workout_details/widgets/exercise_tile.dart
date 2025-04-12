import 'package:flutter/material.dart';
import '../../../models/exercise.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final int index;

  const ExerciseTile({
    super.key,
    required this.exercise,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(
        child: Text('${index + 1}'),
      ),
      title: Text(exercise.name),
      subtitle: Text('${exercise.sets} sets × ${exercise.reps} reps'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(exercise.description),
        ),
      ],
    );
  }
}