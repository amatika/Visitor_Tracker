import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../repositories/activity_repository.dart';

class ActivityProvider with ChangeNotifier {
  List<Activity> _activities = [];
  bool _isLoading = false;
  String? _error;

  List<Activity> get activities => _activities;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ActivityRepository _activityRepository = ActivityRepository();

  Future<void> fetchActivities() async {
    _isLoading = true;
    notifyListeners();
    try {
      _activities = await _activityRepository.getActivities();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Activity? getActivityById(int id) {
    for (final activity in _activities) {
      if (activity.id == id) {
        return activity;
      }
    }
    return null;
  }
}