import 'package:freezed_annotation/freezed_annotation.dart';

part 'rt_table_member.freezed.dart';
part 'rt_table_member.g.dart';

typedef TableMemberID = String;

@freezed
class RtTableMember with _$RtTableMember {
  const RtTableMember._();

  factory RtTableMember({
    required TableMemberID memberID,
    required String name,

    /// queue list number, receiving order
    int? index,
    @Default(false) bool inviteSent,
  }) = _RtTableMember;

  factory RtTableMember.fromJson(Map<String, dynamic> json) =>
      _$RtTableMemberFromJson(json);
}
