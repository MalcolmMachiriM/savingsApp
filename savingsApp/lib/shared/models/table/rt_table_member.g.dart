// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rt_table_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RtTableMember _$$_RtTableMemberFromJson(Map<String, dynamic> json) =>
    _$_RtTableMember(
      memberID: json['memberID'] as String,
      name: json['name'] as String,
      index: json['index'] as int?,
      inviteSent: json['inviteSent'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RtTableMemberToJson(_$_RtTableMember instance) =>
    <String, dynamic>{
      'memberID': instance.memberID,
      'name': instance.name,
      'index': instance.index,
      'inviteSent': instance.inviteSent,
    };
