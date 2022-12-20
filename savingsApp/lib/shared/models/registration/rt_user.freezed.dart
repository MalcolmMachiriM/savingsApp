// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rt_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RtUser _$RtUserFromJson(Map<String, dynamic> json) {
  return _RtUser.fromJson(json);
}

/// @nodoc
class _$RtUserTearOff {
  const _$RtUserTearOff();

  _RtUser call(
      {String? uid,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime dob,
      required double monthlyIncome,
      double? monthlyExpense,
      required String address,
      String? savingGoals}) {
    return _RtUser(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      dob: dob,
      monthlyIncome: monthlyIncome,
      monthlyExpense: monthlyExpense,
      address: address,
      savingGoals: savingGoals,
    );
  }

  RtUser fromJson(Map<String, Object?> json) {
    return RtUser.fromJson(json);
  }
}

/// @nodoc
const $RtUser = _$RtUserTearOff();

/// @nodoc
mixin _$RtUser {
  String? get uid => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'dob',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get dob => throw _privateConstructorUsedError;
  double get monthlyIncome => throw _privateConstructorUsedError;
  double? get monthlyExpense => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get savingGoals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtUserCopyWith<RtUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtUserCopyWith<$Res> {
  factory $RtUserCopyWith(RtUser value, $Res Function(RtUser) then) =
      _$RtUserCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime dob,
      double monthlyIncome,
      double? monthlyExpense,
      String address,
      String? savingGoals});
}

/// @nodoc
class _$RtUserCopyWithImpl<$Res> implements $RtUserCopyWith<$Res> {
  _$RtUserCopyWithImpl(this._value, this._then);

  final RtUser _value;
  // ignore: unused_field
  final $Res Function(RtUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? monthlyIncome = freezed,
    Object? monthlyExpense = freezed,
    Object? address = freezed,
    Object? savingGoals = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthlyIncome: monthlyIncome == freezed
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyExpense: monthlyExpense == freezed
          ? _value.monthlyExpense
          : monthlyExpense // ignore: cast_nullable_to_non_nullable
              as double?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      savingGoals: savingGoals == freezed
          ? _value.savingGoals
          : savingGoals // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RtUserCopyWith<$Res> implements $RtUserCopyWith<$Res> {
  factory _$RtUserCopyWith(_RtUser value, $Res Function(_RtUser) then) =
      __$RtUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime dob,
      double monthlyIncome,
      double? monthlyExpense,
      String address,
      String? savingGoals});
}

/// @nodoc
class __$RtUserCopyWithImpl<$Res> extends _$RtUserCopyWithImpl<$Res>
    implements _$RtUserCopyWith<$Res> {
  __$RtUserCopyWithImpl(_RtUser _value, $Res Function(_RtUser) _then)
      : super(_value, (v) => _then(v as _RtUser));

  @override
  _RtUser get _value => super._value as _RtUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? monthlyIncome = freezed,
    Object? monthlyExpense = freezed,
    Object? address = freezed,
    Object? savingGoals = freezed,
  }) {
    return _then(_RtUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthlyIncome: monthlyIncome == freezed
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyExpense: monthlyExpense == freezed
          ? _value.monthlyExpense
          : monthlyExpense // ignore: cast_nullable_to_non_nullable
              as double?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      savingGoals: savingGoals == freezed
          ? _value.savingGoals
          : savingGoals // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RtUser extends _RtUser {
  _$_RtUser(
      {this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.dob,
      required this.monthlyIncome,
      this.monthlyExpense,
      required this.address,
      this.savingGoals})
      : super._();

  factory _$_RtUser.fromJson(Map<String, dynamic> json) =>
      _$$_RtUserFromJson(json);

  @override
  final String? uid;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  @JsonKey(
      name: 'dob',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime dob;
  @override
  final double monthlyIncome;
  @override
  final double? monthlyExpense;
  @override
  final String address;
  @override
  final String? savingGoals;

  @override
  String toString() {
    return 'RtUser(uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, dob: $dob, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, address: $address, savingGoals: $savingGoals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RtUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality()
                .equals(other.monthlyIncome, monthlyIncome) &&
            const DeepCollectionEquality()
                .equals(other.monthlyExpense, monthlyExpense) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.savingGoals, savingGoals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(monthlyIncome),
      const DeepCollectionEquality().hash(monthlyExpense),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(savingGoals));

  @JsonKey(ignore: true)
  @override
  _$RtUserCopyWith<_RtUser> get copyWith =>
      __$RtUserCopyWithImpl<_RtUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RtUserToJson(this);
  }
}

abstract class _RtUser extends RtUser {
  factory _RtUser(
      {String? uid,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime dob,
      required double monthlyIncome,
      double? monthlyExpense,
      required String address,
      String? savingGoals}) = _$_RtUser;
  _RtUser._() : super._();

  factory _RtUser.fromJson(Map<String, dynamic> json) = _$_RtUser.fromJson;

  @override
  String? get uid;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  @JsonKey(
      name: 'dob',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get dob;
  @override
  double get monthlyIncome;
  @override
  double? get monthlyExpense;
  @override
  String get address;
  @override
  String? get savingGoals;
  @override
  @JsonKey(ignore: true)
  _$RtUserCopyWith<_RtUser> get copyWith => throw _privateConstructorUsedError;
}
