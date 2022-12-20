import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raundtable/shared/utils/index.dart';

part 'medicare_card.freezed.dart';
part 'medicare_card.g.dart';

@freezed
class MedicareCard with _$MedicareCard {
  factory MedicareCard({
    required String cardNumber,
    required int irn,
    @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime expiryDate,
  }) = _MedicareCard;

  factory MedicareCard.fromJson(Map<String, dynamic> json) =>
      _$MedicareCardFromJson(json);
}
