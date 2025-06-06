// providers/visit_provider.dart
import 'package:flutter/material.dart';
import '../models/visit.dart';
import '../repositories/visit_repository.dart';

class VisitProvider with ChangeNotifier {
  List<Visit> _visits = [];
  bool _isLoading = false;
  String? _error;

  List<Visit> get visits => _visits;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final VisitRepository _visitRepository = VisitRepository();

  Future<void> fetchVisits() async {
    _isLoading = true;
    notifyListeners();
    try {
      _visits = await _visitRepository.getVisits();
      _error = null;
    } catch (e) {
      _error ="hello$e";
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addVisit(Visit visit) async {
    try {
      await _visitRepository.addVisit(visit);
      await fetchVisits();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
