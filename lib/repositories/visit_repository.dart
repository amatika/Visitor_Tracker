// repositories/visit_repository.dart
import 'dart:convert';
import '../models/visit.dart';
import '../services/api_service.dart';

class VisitRepository {
  final ApiService _apiService = ApiService();

  Future<List<Visit>> getVisits() async {
    final response = await _apiService.get('/visits');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Visit.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load visits');
    }
  }

  Future<void> addVisit(Visit visit) async {
    final response = await _apiService.post('/visits', visit.toJson());
    if (response.statusCode != 201) {
      throw Exception('Failed to add visit');
    }
  }
}
