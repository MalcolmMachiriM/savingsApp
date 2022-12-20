// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rt_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RtUser _$$_RtUserFromJson(Map<String, dynamic> json) => _$_RtUser(
      uid: json['uid'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dob: firestoreDateOnFromJson(json['dob'] as Timestamp),
      monthlyIncome: (json['monthlyIncome'] as num).toDouble(),
      monthlyExpense: (json['monthlyExpense'] as num?)?.toDouble(),
      address: json['address'] as String,
      savingGoals: json['savingGoals'] as String?,
    );

Map<String, dynamic> _$$_RtUserToJson(_$_RtUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dob': firestoreDateOnToJson(instance.dob),
      'monthlyIncome': instance.monthlyIncome,
      'monthlyExpense': instance.monthlyExpense,
      'address': instance.address,
      'savingGoals': instance.savingGoals,
    };
