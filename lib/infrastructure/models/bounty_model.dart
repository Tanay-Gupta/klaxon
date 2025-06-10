// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bounty_model.freezed.dart';
part 'bounty_model.g.dart';

@freezed
class BountyModel with _$BountyModel {
  const factory BountyModel({
    int? amount,
    @JsonKey(name: 'created_at') String? createdAt,
    String? description,
    int? duration,
    @JsonKey(name: 'end_time') int? endTime,
    int? id,
    String? name,
    bool? paid,
    String? platform,
    @JsonKey(name: 'start_time') int? startTime,
    String? url,
  }) = _BountyModel;

  factory BountyModel.fromJson(Map<String, dynamic> json) =>
      _$BountyModelFromJson(json);
}
