// views/visit_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/visit_provider.dart';
import '../providers/customer_provider.dart';

class VisitListScreen extends StatefulWidget {
  const VisitListScreen({super.key});

  @override
  _VisitListScreenState createState() => _VisitListScreenState();
}

class _VisitListScreenState extends State<VisitListScreen> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Fetch visits and customers when the screen initializes
    Provider.of<VisitProvider>(context, listen: false).fetchVisits();
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    final visitProvider = Provider.of<VisitProvider>(context);
    final customerProvider = Provider.of<CustomerProvider>(context);

    // Filter visits based on search query
    final filteredVisits = visitProvider.visits.where((visit) {
      final customer = customerProvider.getCustomerById(visit.customerId);
      // Ensure customer.name is not null before using toLowerCase()
      // Use the null-aware operator '??' to provide an empty string if customer or customer.name is null
      return customer != null && (customer.name ?? '').toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visits-1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => Navigator.pushNamed(context, '/statistics'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by customer name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
            ),
          ),
          Expanded(
            child: visitProvider.isLoading
                ? const Center(child: CircularProgressIndicator()) // Show loading indicator
                : visitProvider.error != null
                ? Center(child: Text('Error: ${visitProvider.error}')) // Show error message
                : ListView.builder(
              itemCount: filteredVisits.length,
              itemBuilder: (context, index) {
                final visit = filteredVisits[index];
                final customer = customerProvider.getCustomerById(visit.customerId);
                return ListTile(
                  title: Text(customer?.name ?? 'Unknown Customer'), // Provide fallback for customer name
                  subtitle: Text(visit.visitDate ?? 'No Date'), // Provide fallback for visitDate
                  trailing: Text(visit.status ?? 'Unknown Status'), // Provide fallback for status
                  onTap: () {
                    Navigator.pushNamed(context, '/visit_details', arguments: visit);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add_visit'),
        child: const Icon(Icons.add),
      ),
    );
  }
}