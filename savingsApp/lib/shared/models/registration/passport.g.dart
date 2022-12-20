// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Passport _$$_PassportFromJson(Map<String, dynamic> json) => _$_Passport(
      name: json['name'] as String,
      number: json['number'] as String,
      issuedOn: firestoreDateOnFromJson(json['issuedOn'] as Timestamp),
      expireOn: firestoreDateOnFromJson(json['expireOn'] as Timestamp),
      issuingCountry: json['issuingCountry'] as String?,
      visaType: json['visaType'] as String?,
      visaExpiryDate:
          firestoreDateOnFromJson(json['visaExpiryDate'] as Timestamp),
    );

Map<String, dynamic> _$$_PassportToJson(_$_Passport instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'issuedOn': firestoreDateOnToJson(instance.issuedOn),
      'expireOn': firestoreDateOnToJson(instance.expireOn),
      'issuingCountry': instance.issuingCountry,
      'visaType': instance.visaType,
      'visaExpiryDate': firestoreDateOnToJson(instance.visaExpiryDate),
    };
