// views/add_visit_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/customer_provider.dart';
import '../providers/activity_provider.dart';
import '../providers/visit_provider.dart';
import '../models/visit.dart';

class AddVisitScreen extends StatefulWidget {
  const AddVisitScreen({super.key});

  @override
  _AddVisitScreenState createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends State<AddVisitScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _customerId;
  final List<int> _selectedActivities = [];
  DateTime _visitDate = DateTime.now();
  String _status = 'Pending';
  String _location = '';
  String _notes = '';

  @override
  void initState() {
    super.initState();
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
    Provider.of<ActivityProvider>(context, listen: false).fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    final activityProvider = Provider.of<ActivityProvider>(context);
    final visitProvider = Provider.of<VisitProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Visit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Customer'),
                items: customerProvider.customers.map((customer) {
                  return DropdownMenuItem<int>(
                    value: customer.id,
                    child: Text(customer.name),
                  );
                }).toList(),
                value: _customerId,
                onChanged: (value) => setState(() => _customerId = value),
                validator: (value) => value == null ? 'Please select a customer' : null,
              ),
              const SizedBox(height: 16),
              Text('Activities', style: Theme.of(context).textTheme.titleMedium),
              ...activityProvider.activities.map((activity) {
                return CheckboxListTile(
                  title: Text(activity.description),
                  value: _selectedActivities.contains(activity.id),
                  onChanged: (selected) {
                    setState(() {
                      if (selected!) {
                        _selectedActivities.add(activity.id);
                      } else {
                        _selectedActivities.remove(activity.id);
                      }
                    });
                  },
                );
              }),
              const SizedBox(height: 16),
              ListTile(
                title: Text('Visit Date: ${DateFormat.yMd().format(_visitDate)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _visitDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) setState(() => _visitDate = date);
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Status'),
                items: ['Pending', 'Completed', 'Cancelled'].map((status) {
                  return DropdownMenuItem<String>(value: status, child: Text(status));
                }).toList(),
                value: _status,
                onChanged: (value) => setState(() => _status = value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (value) => _location = value,
                validator: (value) => value!.isEmpty ? 'Please enter a location' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Notes'),
                onChanged: (value) => _notes = value,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final visit = Visit(
                      id: 0, // Will be assigned by the server
                      customerId: _customerId!,
                      visitDate: _visitDate.toIso8601String(),
                      status: _status,
                      location: _location,
                      notes: _notes,
                      activitiesDone: _selectedActivities,
                      createdAt: DateTime.now().toIso8601String(),
                    );
                    visitProvider.addVisit(visit).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Text('Save Visit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
