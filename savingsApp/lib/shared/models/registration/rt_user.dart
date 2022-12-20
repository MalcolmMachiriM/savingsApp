import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/fb_date_converter.dart';

part 'rt_user.freezed.dart';
part 'rt_user.g.dart';

@freezed
class RtUser with _$RtUser {
  const RtUser._();

  factory RtUser({
    String? uid,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    @JsonKey(name: 'dob', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime dob,
    required double monthlyIncome,
    double? monthlyExpense,
    required String address,
    String? savingGoals,
  }) = _RtUser;

  factory RtUser.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data as Map<String, dynamic>;

    RtUser ru = RtUser.fromJson(json);
    return ru.copyWith(uid: doc.id);
  }

  factory RtUser.fromJson(Map<String, dynamic> json) => _$RtUserFromJson(json);
}
