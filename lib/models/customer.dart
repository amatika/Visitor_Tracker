// models/customer.dart
import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final int id;
  final String name;
  final String createdAt;

  Customer({required this.id, required this.name, required this.createdAt});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}