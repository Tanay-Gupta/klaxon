// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contest_model.freezed.dart';
part 'contest_model.g.dart';

@freezed
 class ContestModel with _$ContestModel {
  const factory ContestModel({
   
    @JsonKey(name: 'created_at') String? createdAt,
    String? description,
    int? duration,
    @JsonKey(name: 'end_time') int? endTime,
    int? id,
    String? name,
    String? platform,
    @JsonKey(name: 'start_time') int? startTime,
    String? url,
  }) = _ContestModel;

  factory ContestModel.fromJson(Map<String, dynamic> json) =>
      _$ContestModelFromJson(json);
}
