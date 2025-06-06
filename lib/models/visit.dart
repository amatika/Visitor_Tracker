// models/visit.dart
import 'package:json_annotation/json_annotation.dart';
part 'visit.g.dart';

@JsonSerializable()
class Visit {
  final int id;
  final int customerId;
  final String? visitDate; // Make nullable
  final String? status;     // Make nullable
  final String? location;   // Make nullable
  final String? notes;      // Make nullable
  final List<int>? activitiesDone; // Make nullable
  final String? createdAt;  // Make nullable

  Visit({
    required this.id,
    required this.customerId,
    this.visitDate, // No longer required if nullable
    this.status,    // No longer required if nullable
    this.location,  // No longer required if nullable
    this.notes,     // No longer required if nullable
    this.activitiesDone, // No longer required if nullable
    this.createdAt, // No longer required if nullable
  });

  String get displayVisitDate => visitDate ?? '';
  String get displayStatus => status ?? '';
  List<int> get displayActivitiesDone => activitiesDone ?? [];

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);
  Map<String, dynamic> toJson() => _$VisitToJson(this);
}