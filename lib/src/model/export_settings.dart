import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_settings.freezed.dart';
part 'export_settings.g.dart';

enum ExportType { list, map }

@freezed
class ExportSettings with _$ExportSettings {
  const factory ExportSettings({
    Map<String, dynamic>? exportedMetadata,
    @Default(ExportType.map) ExportType exportType,
  }) = _ExportSettings;

  const ExportSettings._();

  factory ExportSettings.fromJson(Map<String, dynamic> json) =>
      _$ExportSettingsFromJson(json);

  static Map<String, dynamic> staticToJson(ExportSettings object) =>
      object.toJson();
}