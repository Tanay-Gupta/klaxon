// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bounty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BountyModel _$BountyModelFromJson(Map<String, dynamic> json) {
  return _BountyModel.fromJson(json);
}

/// @nodoc
mixin _$BountyModel {
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  int? get endTime => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get paid => throw _privateConstructorUsedError;
  String? get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  int? get startTime => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this BountyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BountyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BountyModelCopyWith<BountyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BountyModelCopyWith<$Res> {
  factory $BountyModelCopyWith(
          BountyModel value, $Res Function(BountyModel) then) =
      _$BountyModelCopyWithImpl<$Res, BountyModel>;
  @useResult
  $Res call(
      {int? amount,
      @JsonKey(name: 'created_at') String? createdAt,
      String? description,
      int? duration,
      @JsonKey(name: 'end_time') int? endTime,
      int? id,
      String? name,
      bool? paid,
      String? platform,
      @JsonKey(name: 'start_time') int? startTime,
      String? url});
}

/// @nodoc
class _$BountyModelCopyWithImpl<$Res, $Val extends BountyModel>
    implements $BountyModelCopyWith<$Res> {
  _$BountyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BountyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? endTime = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? paid = freezed,
    Object? platform = freezed,
    Object? startTime = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$BountyModelImplCopyWith<$Res>
    implements $BountyModelCopyWith<$Res> {
  factory _$$BountyModelImplCopyWith(
          _$BountyModelImpl value, $Res Function(_$BountyModelImpl) then) =
      __$$BountyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      @JsonKey(name: 'created_at') String? createdAt,
      String? description,
      int? duration,
      @JsonKey(name: 'end_time') int? endTime,
      int? id,
      String? name,
      bool? paid,
      String? platform,
      @JsonKey(name: 'start_time') int? startTime,
      String? url});
}

/// @nodoc
class __$$BountyModelImplCopyWithImpl<$Res>
    extends _$BountyModelCopyWithImpl<$Res, _$BountyModelImpl>
    implements _$$BountyModelImplCopyWith<$Res> {
  __$$BountyModelImplCopyWithImpl(
      _$BountyModelImpl _value, $Res Function(_$BountyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BountyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? duration = freezed,
    Object? endTime = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? paid = freezed,
    Object? platform = freezed,
    Object? startTime = freezed,
    Object? url = freezed,
  }) {
    return _then(_$BountyModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$BountyModelImpl implements _BountyModel {
  const _$BountyModelImpl(
      {this.amount,
      @JsonKey(name: 'created_at') this.createdAt,
      this.description,
      this.duration,
      @JsonKey(name: 'end_time') this.endTime,
      this.id,
      this.name,
      this.paid,
      this.platform,
      @JsonKey(name: 'start_time') this.startTime,
      this.url});

  factory _$BountyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BountyModelImplFromJson(json);

  @override
  final int? amount;
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
  final bool? paid;
  @override
  final String? platform;
  @override
  @JsonKey(name: 'start_time')
  final int? startTime;
  @override
  final String? url;

  @override
  String toString() {
    return 'BountyModel(amount: $amount, createdAt: $createdAt, description: $description, duration: $duration, endTime: $endTime, id: $id, name: $name, paid: $paid, platform: $platform, startTime: $startTime, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BountyModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, createdAt, description,
      duration, endTime, id, name, paid, platform, startTime, url);

  /// Create a copy of BountyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BountyModelImplCopyWith<_$BountyModelImpl> get copyWith =>
      __$$BountyModelImplCopyWithImpl<_$BountyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BountyModelImplToJson(
      this,
    );
  }
}

abstract class _BountyModel implements BountyModel {
  const factory _BountyModel(
      {final int? amount,
      @JsonKey(name: 'created_at') final String? createdAt,
      final String? description,
      final int? duration,
      @JsonKey(name: 'end_time') final int? endTime,
      final int? id,
      final String? name,
      final bool? paid,
      final String? platform,
      @JsonKey(name: 'start_time') final int? startTime,
      final String? url}) = _$BountyModelImpl;

  factory _BountyModel.fromJson(Map<String, dynamic> json) =
      _$BountyModelImpl.fromJson;

  @override
  int? get amount;
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
  bool? get paid;
  @override
  String? get platform;
  @override
  @JsonKey(name: 'start_time')
  int? get startTime;
  @override
  String? get url;

  /// Create a copy of BountyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BountyModelImplCopyWith<_$BountyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
