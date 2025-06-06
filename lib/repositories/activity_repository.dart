// repositories/activity_repository.dart
import 'dart:convert';
import '../models/activity.dart';
import '../services/api_service.dart';

class ActivityRepository {
  final ApiService _apiService = ApiService();

  Future<List<Activity>> getActivities() async {
    final response = await _apiService.get('/activities');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load activities');
    }
  }
}