// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rt_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RtTable _$RtTableFromJson(Map<String, dynamic> json) {
  return _RtTable.fromJson(json);
}

/// @nodoc
class _$RtTableTearOff {
  const _$RtTableTearOff();

  _RtTable call(
      {required String number,
      required String name,
      required String plan,
      required String creatorID,
      required double amount,
      @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
          required Frequency frequency,
      @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime startDate,
      List<RtTableMember> members = const []}) {
    return _RtTable(
      number: number,
      name: name,
      plan: plan,
      creatorID: creatorID,
      amount: amount,
      frequency: frequency,
      startDate: startDate,
      members: members,
    );
  }

  RtTable fromJson(Map<String, Object?> json) {
    return RtTable.fromJson(json);
  }
}

/// @nodoc
const $RtTable = _$RtTableTearOff();

/// @nodoc
mixin _$RtTable {
  String get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get plan => throw _privateConstructorUsedError;
  String get creatorID => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
  Frequency get frequency => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'startDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get startDate => throw _privateConstructorUsedError;
  List<RtTableMember> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtTableCopyWith<RtTable> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtTableCopyWith<$Res> {
  factory $RtTableCopyWith(RtTable value, $Res Function(RtTable) then) =
      _$RtTableCopyWithImpl<$Res>;
  $Res call(
      {String number,
      String name,
      String plan,
      String creatorID,
      double amount,
      @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
          Frequency frequency,
      @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime startDate,
      List<RtTableMember> members});
}

/// @nodoc
class _$RtTableCopyWithImpl<$Res> implements $RtTableCopyWith<$Res> {
  _$RtTableCopyWithImpl(this._value, this._then);

  final RtTable _value;
  // ignore: unused_field
  final $Res Function(RtTable) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? name = freezed,
    Object? plan = freezed,
    Object? creatorID = freezed,
    Object? amount = freezed,
    Object? frequency = freezed,
    Object? startDate = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      creatorID: creatorID == freezed
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<RtTableMember>,
    ));
  }
}

/// @nodoc
abstract class _$RtTableCopyWith<$Res> implements $RtTableCopyWith<$Res> {
  factory _$RtTableCopyWith(_RtTable value, $Res Function(_RtTable) then) =
      __$RtTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {String number,
      String name,
      String plan,
      String creatorID,
      double amount,
      @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
          Frequency frequency,
      @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime startDate,
      List<RtTableMember> members});
}

/// @nodoc
class __$RtTableCopyWithImpl<$Res> extends _$RtTableCopyWithImpl<$Res>
    implements _$RtTableCopyWith<$Res> {
  __$RtTableCopyWithImpl(_RtTable _value, $Res Function(_RtTable) _then)
      : super(_value, (v) => _then(v as _RtTable));

  @override
  _RtTable get _value => super._value as _RtTable;

  @override
  $Res call({
    Object? number = freezed,
    Object? name = freezed,
    Object? plan = freezed,
    Object? creatorID = freezed,
    Object? amount = freezed,
    Object? frequency = freezed,
    Object? startDate = freezed,
    Object? members = freezed,
  }) {
    return _then(_RtTable(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      creatorID: creatorID == freezed
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<RtTableMember>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RtTable extends _RtTable {
  _$_RtTable(
      {required this.number,
      required this.name,
      required this.plan,
      required this.creatorID,
      required this.amount,
      @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
          required this.frequency,
      @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.startDate,
      this.members = const []})
      : super._();

  factory _$_RtTable.fromJson(Map<String, dynamic> json) =>
      _$$_RtTableFromJson(json);

  @override
  final String number;
  @override
  final String name;
  @override
  final String plan;
  @override
  final String creatorID;
  @override
  final double amount;
  @override
  @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
  final Frequency frequency;
  @override
  @JsonKey(
      name: 'startDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime startDate;
  @JsonKey()
  @override
  final List<RtTableMember> members;

  @override
  String toString() {
    return 'RtTable(number: $number, name: $name, plan: $plan, creatorID: $creatorID, amount: $amount, frequency: $frequency, startDate: $startDate, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RtTable &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.plan, plan) &&
            const DeepCollectionEquality().equals(other.creatorID, creatorID) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.frequency, frequency) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(plan),
      const DeepCollectionEquality().hash(creatorID),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(frequency),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(members));

  @JsonKey(ignore: true)
  @override
  _$RtTableCopyWith<_RtTable> get copyWith =>
      __$RtTableCopyWithImpl<_RtTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RtTableToJson(this);
  }
}

abstract class _RtTable extends RtTable {
  factory _RtTable(
      {required String number,
      required String name,
      required String plan,
      required String creatorID,
      required double amount,
      @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
          required Frequency frequency,
      @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime startDate,
      List<RtTableMember> members}) = _$_RtTable;
  _RtTable._() : super._();

  factory _RtTable.fromJson(Map<String, dynamic> json) = _$_RtTable.fromJson;

  @override
  String get number;
  @override
  String get name;
  @override
  String get plan;
  @override
  String get creatorID;
  @override
  double get amount;
  @override
  @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
  Frequency get frequency;
  @override
  @JsonKey(
      name: 'startDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get startDate;
  @override
  List<RtTableMember> get members;
  @override
  @JsonKey(ignore: true)
  _$RtTableCopyWith<_RtTable> get copyWith =>
      throw _privateConstructorUsedError;
}
