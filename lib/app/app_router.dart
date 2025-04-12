import 'package:go_router/go_router.dart';
import '../features/home/screens/home_screen.dart';
import '../features/workout_details/screens/workout_details_screen.dart';
import '../features/statistics/screens/statistics_screen.dart';
import '../features/settings/screens/settings_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'workout/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return WorkoutDetailsScreen(workoutId: id);
          },
        ),
        GoRoute(
          path: 'statistics',
          builder: (context, state) => const StatisticsScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);