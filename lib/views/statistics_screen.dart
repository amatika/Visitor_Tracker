// views/statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/visit_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final visitProvider = Provider.of<VisitProvider>(context);

    final totalVisits = visitProvider.visits.length;
    final completedVisits = visitProvider.visits.where((v) => v.status == 'Completed').length;
    final pendingVisits = visitProvider.visits.where((v) => v.status == 'Pending').length;
    final cancelledVisits = visitProvider.visits.where((v) => v.status == 'Cancelled').length;

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Visits: $totalVisits', style: const TextStyle(fontSize: 18)),
            Text('Completed Visits: $completedVisits', style: const TextStyle(fontSize: 18)),
            Text('Pending Visits: $pendingVisits', style: const TextStyle(fontSize: 18)),
            Text('Cancelled Visits: $cancelledVisits', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}