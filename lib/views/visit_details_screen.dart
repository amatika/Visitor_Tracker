// views/visit_details_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/customer_provider.dart';
import '../providers/activity_provider.dart';
import '../models/visit.dart';

class VisitDetailsScreen extends StatelessWidget {
  const VisitDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final visit = ModalRoute.of(context)!.settings.arguments as Visit;
    final customerProvider = Provider.of<CustomerProvider>(context);
    final activityProvider = Provider.of<ActivityProvider>(context);
    final customer = customerProvider.getCustomerById(visit.customerId);

    // Handle activitiesDone which is now List<int>?
    final activities = visit.activitiesDone
        ?.map((id) => activityProvider.getActivityById(id)?.description ?? 'Unknown')
        .toList() ??
        []; // Provide an empty list if activitiesDone is null

    return Scaffold(
      appBar: AppBar(title: const Text('Visit Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Customer: ${customer?.name ?? "Unknown"}', style: const TextStyle(fontSize: 18)),            // Fix for visitDate: Handle null with '??' and parse only if not null
            Text('Date: ${visit.visitDate != null ? DateFormat.yMd().format(DateTime.parse(visit.visitDate!)) : "N/A"}'),
            // Fix for status, location, notes: Use null-aware operator '??' to provide a fallback
            Text('Status: ${visit.status ?? "N/A"}'),
            Text('Location: ${visit.location ?? "N/A"}'),
            Text('Notes: ${visit.notes ?? "No notes"}'),
            const SizedBox(height: 16),
            Text('Activities Done', style: Theme.of(context).textTheme.titleMedium),
            // Iterate over the potentially empty 'activities' list
            ...activities.map((activity) => ListTile(
              title: Text(activity),
            )),
          ],
        ),
      ),
    );
  }
}