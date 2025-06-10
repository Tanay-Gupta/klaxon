// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BountyModelImpl _$$BountyModelImplFromJson(Map<String, dynamic> json) =>
    _$BountyModelImpl(
      amount: (json['amount'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      endTime: (json['end_time'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      paid: json['paid'] as bool?,
      platform: json['platform'] as String?,
      startTime: (json['start_time'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$BountyModelImplToJson(_$BountyModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'created_at': instance.createdAt,
      'description': instance.description,
      'duration': instance.duration,
      'end_time': instance.endTime,
      'id': instance.id,
      'name': instance.name,
      'paid': instance.paid,
      'platform': instance.platform,
      'start_time': instance.startTime,
      'url': instance.url,
    };
