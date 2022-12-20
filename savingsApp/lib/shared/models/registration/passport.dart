import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raundtable/shared/utils/index.dart';

part 'passport.freezed.dart';
part 'passport.g.dart';

@freezed
class Passport with _$Passport {
  factory Passport({
    /// user name as it appears on the passport
    required String name,
    required String number,
    @JsonKey(name: 'issuedOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime issuedOn,
    @JsonKey(name: 'expireOn', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime expireOn,
    // for foreign passport
    String? issuingCountry,
    String? visaType,
    @JsonKey(name: 'visaExpiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime visaExpiryDate,
  }) = _Passport;

  factory Passport.fromJson(Map<String, dynamic> json) =>
      _$PassportFromJson(json);
}
