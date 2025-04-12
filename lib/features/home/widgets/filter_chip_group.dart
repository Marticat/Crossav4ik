import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_provider.dart';
import '../../../models/workout.dart';

class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: provider.selectedDifficulty == null,
            onSelected: (_) => provider.setDifficultyFilter(null),
          ),
          const SizedBox(width: 8),
          ...Difficulty.values.map((difficulty) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(_getDifficultyText(difficulty)),
                selected: provider.selectedDifficulty == difficulty,
                onSelected: (_) => provider.setDifficultyFilter(difficulty),
              ),
            );
          }),
        ],
      ),
    );
  }

  String _getDifficultyText(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.beginner:
        return 'Beginner';
      case Difficulty.intermediate:
        return 'Intermediate';
      case Difficulty.advanced:
        return 'Advanced';
    }
  }
}
