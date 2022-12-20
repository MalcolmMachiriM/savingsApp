import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raundtable/shared/utils/index.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
class License with _$License {
  factory License({
    required String state,
    required String number,
    @JsonKey(name: 'expiryDate', fromJson: firestoreDateOnFromJson, toJson: firestoreDateOnToJson)
        required DateTime expiryDate,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}
