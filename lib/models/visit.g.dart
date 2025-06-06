// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visit _$VisitFromJson(Map<String, dynamic> json) => Visit(
      id: (json['id'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      visitDate: json['visitDate'] as String?,
      status: json['status'] as String?,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
      activitiesDone: (json['activitiesDone'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$VisitToJson(Visit instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'visitDate': instance.visitDate,
      'status': instance.status,
      'location': instance.location,
      'notes': instance.notes,
      'activitiesDone': instance.activitiesDone,
      'createdAt': instance.createdAt,
    };
