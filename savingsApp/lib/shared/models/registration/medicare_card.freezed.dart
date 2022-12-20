// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'medicare_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicareCard _$MedicareCardFromJson(Map<String, dynamic> json) {
  return _MedicareCard.fromJson(json);
}

/// @nodoc
class _$MedicareCardTearOff {
  const _$MedicareCardTearOff();

  _MedicareCard call(
      {required String cardNumber,
      required int irn,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expiryDate}) {
    return _MedicareCard(
      cardNumber: cardNumber,
      irn: irn,
      expiryDate: expiryDate,
    );
  }

  MedicareCard fromJson(Map<String, Object?> json) {
    return MedicareCard.fromJson(json);
  }
}

/// @nodoc
const $MedicareCard = _$MedicareCardTearOff();

/// @nodoc
mixin _$MedicareCard {
  String get cardNumber => throw _privateConstructorUsedError;
  int get irn => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicareCardCopyWith<MedicareCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicareCardCopyWith<$Res> {
  factory $MedicareCardCopyWith(
          MedicareCard value, $Res Function(MedicareCard) then) =
      _$MedicareCardCopyWithImpl<$Res>;
  $Res call(
      {String cardNumber,
      int irn,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expiryDate});
}

/// @nodoc
class _$MedicareCardCopyWithImpl<$Res> implements $MedicareCardCopyWith<$Res> {
  _$MedicareCardCopyWithImpl(this._value, this._then);

  final MedicareCard _value;
  // ignore: unused_field
  final $Res Function(MedicareCard) _then;

  @override
  $Res call({
    Object? cardNumber = freezed,
    Object? irn = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      irn: irn == freezed
          ? _value.irn
          : irn // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MedicareCardCopyWith<$Res>
    implements $MedicareCardCopyWith<$Res> {
  factory _$MedicareCardCopyWith(
          _MedicareCard value, $Res Function(_MedicareCard) then) =
      __$MedicareCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String cardNumber,
      int irn,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          DateTime expiryDate});
}

/// @nodoc
class __$MedicareCardCopyWithImpl<$Res> extends _$MedicareCardCopyWithImpl<$Res>
    implements _$MedicareCardCopyWith<$Res> {
  __$MedicareCardCopyWithImpl(
      _MedicareCard _value, $Res Function(_MedicareCard) _then)
      : super(_value, (v) => _then(v as _MedicareCard));

  @override
  _MedicareCard get _value => super._value as _MedicareCard;

  @override
  $Res call({
    Object? cardNumber = freezed,
    Object? irn = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_MedicareCard(
      cardNumber: cardNumber == freezed
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      irn: irn == freezed
          ? _value.irn
          : irn // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicareCard implements _MedicareCard {
  _$_MedicareCard(
      {required this.cardNumber,
      required this.irn,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required this.expiryDate});

  factory _$_MedicareCard.fromJson(Map<String, dynamic> json) =>
      _$$_MedicareCardFromJson(json);

  @override
  final String cardNumber;
  @override
  final int irn;
  @override
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  final DateTime expiryDate;

  @override
  String toString() {
    return 'MedicareCard(cardNumber: $cardNumber, irn: $irn, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicareCard &&
            const DeepCollectionEquality()
                .equals(other.cardNumber, cardNumber) &&
            const DeepCollectionEquality().equals(other.irn, irn) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cardNumber),
      const DeepCollectionEquality().hash(irn),
      const DeepCollectionEquality().hash(expiryDate));

  @JsonKey(ignore: true)
  @override
  _$MedicareCardCopyWith<_MedicareCard> get copyWith =>
      __$MedicareCardCopyWithImpl<_MedicareCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicareCardToJson(this);
  }
}

abstract class _MedicareCard implements MedicareCard {
  factory _MedicareCard(
      {required String cardNumber,
      required int irn,
      @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
          required DateTime expiryDate}) = _$_MedicareCard;

  factory _MedicareCard.fromJson(Map<String, dynamic> json) =
      _$_MedicareCard.fromJson;

  @override
  String get cardNumber;
  @override
  int get irn;
  @override
  @JsonKey(
      name: 'expiryDate',
      fromJson: firestoreDateOnFromJson,
      toJson: firestoreDateOnToJson)
  DateTime get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$MedicareCardCopyWith<_MedicareCard> get copyWith =>
      throw _privateConstructorUsedError;
}
