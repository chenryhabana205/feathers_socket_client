// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$_$_TodoFromJson(Map<String, dynamic> json) {
  return _$_Todo(
    json['name'] as String,
    json['description'] as String,
    json['completed'] as bool,
    ownerId: json['ownerId'] as String,
    id: json['_id'] as String,
  );
}

Map<String, dynamic> _$_$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'completed': instance.completed,
      'ownerId': instance.ownerId,
      '_id': instance.id,
    };
