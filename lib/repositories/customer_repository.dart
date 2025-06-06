// repositories/customer_repository.dart
import 'dart:convert';
import '../models/customer.dart';
import '../services/api_service.dart';

class CustomerRepository {
  final ApiService _apiService = ApiService();

  Future<List<Customer>> getCustomers() async {
    final response = await _apiService.get('/customers');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }
}