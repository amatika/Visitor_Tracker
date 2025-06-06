import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../repositories/customer_repository.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _customers = [];
  bool _isLoading = false;
  String? _error;

  List<Customer> get customers => _customers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final CustomerRepository _customerRepository = CustomerRepository();

  Future<void> fetchCustomers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _customers = await _customerRepository.getCustomers();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Customer? getCustomerById(int id) {
    for (final customer in _customers) {
      if (customer.id == id) {
        return customer;
      }
    }
    return null;
  }
}