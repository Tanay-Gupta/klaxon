// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hackathon_model.freezed.dart';
part 'hackathon_model.g.dart';

@freezed
class HackathonModel with _$HackathonModel {
  const factory HackathonModel({
    @JsonKey(name: 'created_at') String? createdAt,
    String? description,
    int? duration,
    @JsonKey(name: 'end_time') int? endTime,
    int? id,
    String? mode,
    String? name,
    String? platform,
    @JsonKey(name: 'start_time') int? startTime,
    String? url,
  }) = _HackathonModel;

  factory HackathonModel.fromJson(Map<String, dynamic> json) =>
      _$HackathonModelFromJson(json);
}
