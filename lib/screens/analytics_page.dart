import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:demo_crm/data/mock_data.dart';
import 'package:demo_crm/l10n/app_localizations.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.translate('analytics'),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loc.translate('sales'),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              barGroups: [
                                BarChartGroupData(
                                  x: 0,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 8,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 10,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 2,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 14,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 3,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 15,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 4,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 13,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 5,
                                  barRods: [
                                    BarChartRodData(
                                      toY: 10,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ],
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final titles = [
                                        'Jan',
                                        'Feb',
                                        'Mar',
                                        'Apr',
                                        'May',
                                        'Jun',
                                      ];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8.0,
                                        ),
                                        child: Text(
                                          titles[value.toInt() % titles.length],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
