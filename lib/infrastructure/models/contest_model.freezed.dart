// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContestModel _$ContestModelFromJson(Map<String, dynamic> json) {
  return _ContestModel.fromJson(json);
}

/// @nodoc
mixin _$ContestModel {
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  int? get endTime => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  int? get startTime => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this ContestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContestModelCopyWith<ContestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestModelCopyWith<$Res> {
  factory $ContestModelCopyWith(
          ContestModel value, $Res Function(ContestModel) then) =
      _$ContestModelCopyWithImpl<$Res, ContestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String? createdAt,
      String? description,
      int? duration,
      @JsonKey(name: 'end_time') int? endTime,
      int? id,
      String? name,
      String? platform,
      @JsonKey(name: 'start_time') int? startTime,
      String? url});
}

/// @nodoc
class _$ContestModelCopyWithImpl<$Res, $Val extends ContestModel>
    implements $ContestModelCopyWith<$Res> {
  _$ContestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? endTime = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? startTime = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContestModelImplCopyWith<$Res>
    implements $ContestModelCopyWith<$Res> {
  factory _$$ContestModelImplCopyWith(
          _$ContestModelImpl value, $Res Function(_$ContestModelImpl) then) =
      __$$ContestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String? createdAt,
      String? description,
      int? duration,
      @JsonKey(name: 'end_time') int? endTime,
      int? id,
      String? name,
      String? platform,
      @JsonKey(name: 'start_time') int? startTime,
      String? url});
}

/// @nodoc
class __$$ContestModelImplCopyWithImpl<$Res>
    extends _$ContestModelCopyWithImpl<$Res, _$ContestModelImpl>
    implements _$$ContestModelImplCopyWith<$Res> {
  __$$ContestModelImplCopyWithImpl(
      _$ContestModelImpl _value, $Res Function(_$ContestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? endTime = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? startTime = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ContestModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContestModelImpl implements _ContestModel {
  const _$ContestModelImpl(
      {@JsonKey(name: 'created_at') this.createdAt,
      this.description,
      this.duration,
      @JsonKey(name: 'end_time') this.endTime,
      this.id,
      this.name,
      this.platform,
      @JsonKey(name: 'start_time') this.startTime,
      this.url});

  factory _$ContestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContestModelImplFromJson(json);

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final String? description;
  @override
  final int? duration;
  @override
  @JsonKey(name: 'end_time')
  final int? endTime;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? platform;
  @override
  @JsonKey(name: 'start_time')
  final int? startTime;
  @override
  final String? url;

  @override
  String toString() {
    return 'ContestModel(createdAt: $createdAt, description: $description, duration: $duration, endTime: $endTime, id: $id, name: $name, platform: $platform, startTime: $startTime, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContestModelImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, description, duration,
      endTime, id, name, platform, startTime, url);

  /// Create a copy of ContestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContestModelImplCopyWith<_$ContestModelImpl> get copyWith =>
      __$$ContestModelImplCopyWithImpl<_$ContestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContestModelImplToJson(
      this,
    );
  }
}

abstract class _ContestModel implements ContestModel {
  const factory _ContestModel(
      {@JsonKey(name: 'created_at') final String? createdAt,
      final String? description,
      final int? duration,
      @JsonKey(name: 'end_time') final int? endTime,
      final int? id,
      final String? name,
      final String? platform,
      @JsonKey(name: 'start_time') final int? startTime,
      final String? url}) = _$ContestModelImpl;

  factory _ContestModel.fromJson(Map<String, dynamic> json) =
      _$ContestModelImpl.fromJson;

  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  String? get description;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'end_time')
  int? get endTime;
  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get platform;
  @override
  @JsonKey(name: 'start_time')
  int? get startTime;
  @override
  String? get url;

  /// Create a copy of ContestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContestModelImplCopyWith<_$ContestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
