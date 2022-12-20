// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

License _$LicenseFromJson(Map<String, dynamic> json) {
  return _License.fromJson(json);
}

/// @nodoc
class _$LicenseTearOff {
  const _$LicenseTearOff();

  _License call(
      {required String state,
      required String number,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expiryDate}) {
    return _License(
      state: state,
      number: number,
      expiryDate: expiryDate,
    );
  }

  License fromJson(Map<String, Object?> json) {
    return License.fromJson(json);
  }
}

/// @nodoc
const $License = _$LicenseTearOff();

/// @nodoc
mixin _$License {
  String get state => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseCopyWith<License> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseCopyWith<$Res> {
  factory $LicenseCopyWith(License value, $Res Function(License) then) =
      _$LicenseCopyWithImpl<$Res>;
  $Res call(
      {String state,
      String number,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expiryDate});
}

/// @nodoc
class _$LicenseCopyWithImpl<$Res> implements $LicenseCopyWith<$Res> {
  _$LicenseCopyWithImpl(this._value, this._then);

  final License _value;
  // ignore: unused_field
  final $Res Function(License) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? number = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$LicenseCopyWith<$Res> implements $LicenseCopyWith<$Res> {
  factory _$LicenseCopyWith(_License value, $Res Function(_License) then) =
      __$LicenseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String state,
      String number,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expiryDate});
}

/// @nodoc
class __$LicenseCopyWithImpl<$Res> extends _$LicenseCopyWithImpl<$Res>
    implements _$LicenseCopyWith<$Res> {
  __$LicenseCopyWithImpl(_License _value, $Res Function(_License) _then)
      : super(_value, (v) => _then(v as _License));

  @override
  _License get _value => super._value as _License;

  @override
  $Res call({
    Object? state = freezed,
    Object? number = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_License(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_License implements _License {
  _$_License(
      {required this.state,
      required this.number,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.expiryDate});

  factory _$_License.fromJson(Map<String, dynamic> json) =>
      _$$_LicenseFromJson(json);

  @override
  final String state;
  @override
  final String number;
  @override
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime expiryDate;

  @override
  String toString() {
    return 'License(state: $state, number: $number, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _License &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(expiryDate));

  @JsonKey(ignore: true)
  @override
  _$LicenseCopyWith<_License> get copyWith =>
      __$LicenseCopyWithImpl<_License>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LicenseToJson(this);
  }
}

abstract class _License implements License {
  factory _License(
      {required String state,
      required String number,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expiryDate}) = _$_License;

  factory _License.fromJson(Map<String, dynamic> json) = _$_License.fromJson;

  @override
  String get state;
  @override
  String get number;
  @override
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$LicenseCopyWith<_License> get copyWith =>
      throw _privateConstructorUsedError;
}
