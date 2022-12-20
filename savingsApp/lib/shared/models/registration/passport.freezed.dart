// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Passport _$PassportFromJson(Map<String, dynamic> json) {
  return _Passport.fromJson(json);
}

/// @nodoc
class _$PassportTearOff {
  const _$PassportTearOff();

  _Passport call(
      {required String name,
      required String number,
      @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime issuedOn,
      @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expireOn,
      String? issuingCountry,
      String? visaType,
      @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime visaExpiryDate}) {
    return _Passport(
      name: name,
      number: number,
      issuedOn: issuedOn,
      expireOn: expireOn,
      issuingCountry: issuingCountry,
      visaType: visaType,
      visaExpiryDate: visaExpiryDate,
    );
  }

  Passport fromJson(Map<String, Object?> json) {
    return Passport.fromJson(json);
  }
}

/// @nodoc
const $Passport = _$PassportTearOff();

/// @nodoc
mixin _$Passport {
  /// user name as it appears on the passport
  String get name => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'issuedOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get issuedOn => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'expireOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expireOn =>
      throw _privateConstructorUsedError; // for foreign passport
  String? get issuingCountry => throw _privateConstructorUsedError;
  String? get visaType => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'visaExpiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get visaExpiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassportCopyWith<Passport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassportCopyWith<$Res> {
  factory $PassportCopyWith(Passport value, $Res Function(Passport) then) =
      _$PassportCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String number,
      @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime issuedOn,
      @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expireOn,
      String? issuingCountry,
      String? visaType,
      @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime visaExpiryDate});
}

/// @nodoc
class _$PassportCopyWithImpl<$Res> implements $PassportCopyWith<$Res> {
  _$PassportCopyWithImpl(this._value, this._then);

  final Passport _value;
  // ignore: unused_field
  final $Res Function(Passport) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? issuedOn = freezed,
    Object? expireOn = freezed,
    Object? issuingCountry = freezed,
    Object? visaType = freezed,
    Object? visaExpiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      issuedOn: issuedOn == freezed
          ? _value.issuedOn
          : issuedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireOn: expireOn == freezed
          ? _value.expireOn
          : expireOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issuingCountry: issuingCountry == freezed
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      visaType: visaType == freezed
          ? _value.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String?,
      visaExpiryDate: visaExpiryDate == freezed
          ? _value.visaExpiryDate
          : visaExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PassportCopyWith<$Res> implements $PassportCopyWith<$Res> {
  factory _$PassportCopyWith(_Passport value, $Res Function(_Passport) then) =
      __$PassportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String number,
      @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime issuedOn,
      @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expireOn,
      String? issuingCountry,
      String? visaType,
      @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime visaExpiryDate});
}

/// @nodoc
class __$PassportCopyWithImpl<$Res> extends _$PassportCopyWithImpl<$Res>
    implements _$PassportCopyWith<$Res> {
  __$PassportCopyWithImpl(_Passport _value, $Res Function(_Passport) _then)
      : super(_value, (v) => _then(v as _Passport));

  @override
  _Passport get _value => super._value as _Passport;

  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? issuedOn = freezed,
    Object? expireOn = freezed,
    Object? issuingCountry = freezed,
    Object? visaType = freezed,
    Object? visaExpiryDate = freezed,
  }) {
    return _then(_Passport(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      issuedOn: issuedOn == freezed
          ? _value.issuedOn
          : issuedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireOn: expireOn == freezed
          ? _value.expireOn
          : expireOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issuingCountry: issuingCountry == freezed
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      visaType: visaType == freezed
          ? _value.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String?,
      visaExpiryDate: visaExpiryDate == freezed
          ? _value.visaExpiryDate
          : visaExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Passport implements _Passport {
  _$_Passport(
      {required this.name,
      required this.number,
      @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.issuedOn,
      @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.expireOn,
      this.issuingCountry,
      this.visaType,
      @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.visaExpiryDate});

  factory _$_Passport.fromJson(Map<String, dynamic> json) =>
      _$$_PassportFromJson(json);

  @override

  /// user name as it appears on the passport
  final String name;
  @override
  final String number;
  @override
  @JsonKey(
      name: 'issuedOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime issuedOn;
  @override
  @JsonKey(
      name: 'expireOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime expireOn;
  @override // for foreign passport
  final String? issuingCountry;
  @override
  final String? visaType;
  @override
  @JsonKey(
      name: 'visaExpiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime visaExpiryDate;

  @override
  String toString() {
    return 'Passport(name: $name, number: $number, issuedOn: $issuedOn, expireOn: $expireOn, issuingCountry: $issuingCountry, visaType: $visaType, visaExpiryDate: $visaExpiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Passport &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.issuedOn, issuedOn) &&
            const DeepCollectionEquality().equals(other.expireOn, expireOn) &&
            const DeepCollectionEquality()
                .equals(other.issuingCountry, issuingCountry) &&
            const DeepCollectionEquality().equals(other.visaType, visaType) &&
            const DeepCollectionEquality()
                .equals(other.visaExpiryDate, visaExpiryDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(issuedOn),
      const DeepCollectionEquality().hash(expireOn),
      const DeepCollectionEquality().hash(issuingCountry),
      const DeepCollectionEquality().hash(visaType),
      const DeepCollectionEquality().hash(visaExpiryDate));

  @JsonKey(ignore: true)
  @override
  _$PassportCopyWith<_Passport> get copyWith =>
      __$PassportCopyWithImpl<_Passport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassportToJson(this);
  }
}

abstract class _Passport implements Passport {
  factory _Passport(
      {required String name,
      required String number,
      @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime issuedOn,
      @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expireOn,
      String? issuingCountry,
      String? visaType,
      @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime visaExpiryDate}) = _$_Passport;

  factory _Passport.fromJson(Map<String, dynamic> json) = _$_Passport.fromJson;

  @override

  /// user name as it appears on the passport
  String get name;
  @override
  String get number;
  @override
  @JsonKey(
      name: 'issuedOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get issuedOn;
  @override
  @JsonKey(
      name: 'expireOn',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expireOn;
  @override // for foreign passport
  String? get issuingCountry;
  @override
  String? get visaType;
  @override
  @JsonKey(
      name: 'visaExpiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get visaExpiryDate;
  @override
  @JsonKey(ignore: true)
  _$PassportCopyWith<_Passport> get copyWith =>
      throw _privateConstructorUsedError;
}
