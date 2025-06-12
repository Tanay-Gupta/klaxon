// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hackathon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HackathonModelImpl _$$HackathonModelImplFromJson(Map<String, dynamic> json) =>
    _$HackathonModelImpl(
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      endTime: (json['end_time'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      mode: json['mode'] as String?,
      name: json['name'] as String?,
      platform: json['platform'] as String?,
      startTime: (json['start_time'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$HackathonModelImplToJson(
        _$HackathonModelImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': instance.description,
      'duration': instance.duration,
      'end_time': instance.endTime,
      'id': instance.id,
      'mode': instance.mode,
      'name': instance.name,
      'platform': instance.platform,
      'start_time': instance.startTime,
      'url': instance.url,
    };
