// models/activity.dart
import 'package:json_annotation/json_annotation.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {
  final int id;
  final String description;
  final String createdAt;

  Activity({required this.id, required this.description, required this.createdAt});

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
