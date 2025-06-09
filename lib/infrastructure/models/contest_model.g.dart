// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContestModelImpl _$$ContestModelImplFromJson(Map<String, dynamic> json) =>
    _$ContestModelImpl(
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      endTime: (json['end_time'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      platform: json['platform'] as String?,
      startTime: (json['start_time'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ContestModelImplToJson(_$ContestModelImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': instance.description,
      'duration': instance.duration,
      'end_time': instance.endTime,
      'id': instance.id,
      'name': instance.name,
      'platform': instance.platform,
      'start_time': instance.startTime,
      'url': instance.url,
    };
