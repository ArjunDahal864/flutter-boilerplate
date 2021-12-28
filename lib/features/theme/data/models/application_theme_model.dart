import 'package:boiler/features/theme/domain/entities/application_theme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_theme_model.g.dart';

@JsonSerializable()
class ApplicationThemeModel extends ApplicationTheme{
  @JsonKey(name: "theme_type")
  final String name;
  const ApplicationThemeModel({required this.name}) : super(themeType: name);
  factory ApplicationThemeModel.fromJson(Map<String, dynamic> json) => _$ApplicationThemeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationThemeModelToJson(this);

}