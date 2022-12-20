// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_License _$$_LicenseFromJson(Map<String, dynamic> json) => _$_License(
      state: json['state'] as String,
      number: json['number'] as String,
      expiryDate: firestoreDateOnFromJson(json['expiryDate'] as Timestamp),
    );

Map<String, dynamic> _$$_LicenseToJson(_$_License instance) =>
    <String, dynamic>{
      'state': instance.state,
      'number': instance.number,
      'expiryDate': firestoreDateOnToJson(instance.expiryDate),
    };
