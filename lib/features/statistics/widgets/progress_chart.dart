import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressChart extends StatelessWidget {
  final String title;
  final bool isWeekly;

  const ProgressChart({
    super.key,
    required this.title,
    required this.isWeekly,
  });

  @override
  Widget build(BuildContext context) {
    // Sample data
    final data = [
      _ChartData('Mon', 5),
      _ChartData('Tue', 7),
      _ChartData('Wed', 6),
      _ChartData('Thu', 8),
      _ChartData('Fri', 4),
      _ChartData('Sat', 9),
      _ChartData('Sun', 6),
    ];

    // Convert _ChartData into the format fl_chart expects
    final barData = data.map((dataPoint) {
      return BarChartGroupData(
        x: _getDayIndex(dataPoint.day), // Get the index of the day
        barRods: [
          BarChartRodData(
            toY: dataPoint.value.toDouble(),
            color: Colors.blue, // Color
            width: 16, // Bar width
          ),
        ],
      );
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: barData,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            _getDayName(value.toInt()), // Display the day name
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to convert day name to index
  int _getDayIndex(String day) {
    switch (day) {
      case 'Mon': return 0;
      case 'Tue': return 1;
      case 'Wed': return 2;
      case 'Thu': return 3;
      case 'Fri': return 4;
      case 'Sat': return 5;
      case 'Sun': return 6;
      default: return 0;
    }
  }

  // Helper to get day name from index
  String _getDayName(int index) {
    switch (index) {
      case 0: return 'Mon';
      case 1: return 'Tue';
      case 2: return 'Wed';
      case 3: return 'Thu';
      case 4: return 'Fri';
      case 5: return 'Sat';
      case 6: return 'Sun';
      default: return 'Mon';
    }
  }
}

class _ChartData {
  final String day;
  final int value;

  _ChartData(this.day, this.value);
}
