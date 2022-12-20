import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raundtable/constants/frequency_enum.dart';
import 'package:raundtable/shared/utils/index.dart';

import 'rt_table_member.dart';

part 'rt_table.freezed.dart';
part 'rt_table.g.dart';

typedef CreatorID = String;

@freezed
class RtTable with _$RtTable {
  const RtTable._();

  factory RtTable({
    required String number,
    required String name,
    required String plan,
    required CreatorID creatorID,
    required double amount,
    @JsonKey(name: 'frequency', fromJson: stringToEnum, toJson: enumToStringItem)
        required Frequency frequency,
    @JsonKey(name: 'startDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime startDate,
    @Default([]) List<RtTableMember> members,
  }) = _RtTable;

  factory RtTable.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data as Map<String, dynamic>;

    RtTable rt = RtTable.fromJson(json);
    return rt.copyWith(number: doc.id);
  }

  factory RtTable.fromJson(Map<String, dynamic> json) =>
      _$RtTableFromJson(json);
}
