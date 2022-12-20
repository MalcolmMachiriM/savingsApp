// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rt_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RtTable _$$_RtTableFromJson(Map<String, dynamic> json) => _$_RtTable(
      number: json['number'] as String,
      name: json['name'] as String,
      plan: json['plan'] as String,
      creatorID: json['creatorID'] as String,
      amount: (json['amount'] as num).toDouble(),
      frequency: stringToEnum(json['frequency'] as String),
      startDate: firestoreDateOnFromJson(json['startDate'] as Timestamp),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => RtTableMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RtTableToJson(_$_RtTable instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'plan': instance.plan,
      'creatorID': instance.creatorID,
      'amount': instance.amount,
      'frequency': enumToStringItem(instance.frequency),
      'startDate': firestoreDateOnToJson(instance.startDate),
      'members': instance.members,
    };
