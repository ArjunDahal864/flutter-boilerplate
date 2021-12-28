import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locale_model.g.dart';

@JsonSerializable()
class LocaleModel extends Locale{
  @JsonValue("launguage_code")
  final String lC;
  @JsonValue("country_code")
  final String cC;
  @JsonValue("user_id")
  final String uID;
  const LocaleModel({required this.lC, required this.cC, required this.uID}):super(countryCode: cC, languageCode: lC, userID: uID);
  factory LocaleModel.fromJson(Map<String, dynamic> json) => _$LocaleModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocaleModelToJson(this);
}