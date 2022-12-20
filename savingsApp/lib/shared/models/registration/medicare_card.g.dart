// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicare_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicareCard _$$_MedicareCardFromJson(Map<String, dynamic> json) =>
    _$_MedicareCard(
      cardNumber: json['cardNumber'] as String,
      irn: json['irn'] as int,
      expiryDate: firestoreDateOnFromJson(json['expiryDate'] as Timestamp),
    );

Map<String, dynamic> _$$_MedicareCardToJson(_$_MedicareCard instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'irn': instance.irn,
      'expiryDate': firestoreDateOnToJson(instance.expiryDate),
    };
