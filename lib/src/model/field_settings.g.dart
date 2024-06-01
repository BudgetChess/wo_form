// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectFieldSettings<T> _$SelectFieldSettingsFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SelectFieldSettings<T>(
      labelText: json['labelText'] as String?,
      values: (json['values'] as List<dynamic>?)?.map(fromJsonT).toList(),
      displayMode: $enumDecodeNullable(
          _$SelectFieldDisplayModeEnumMap, json['displayMode']),
    );

Map<String, dynamic> _$SelectFieldSettingsToJson<T>(
  SelectFieldSettings<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'labelText': instance.labelText,
      'values': instance.values?.map(toJsonT).toList(),
      'displayMode': _$SelectFieldDisplayModeEnumMap[instance.displayMode],
    };

const _$SelectFieldDisplayModeEnumMap = {
  SelectFieldDisplayMode.selectChip: 'selectChip',
  SelectFieldDisplayMode.radios: 'radios',
};

_$BooleanFieldSettingsImpl _$$BooleanFieldSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$BooleanFieldSettingsImpl(
      labelText: json['labelText'] as String?,
      onOffType: $enumDecodeNullable(
          _$BooleanFieldOnOffTypeEnumMap, json['onOffType']),
      onOffPosition: $enumDecodeNullable(
          _$ListTileControlAffinityEnumMap, json['onOffPosition']),
    );

Map<String, dynamic> _$$BooleanFieldSettingsImplToJson(
        _$BooleanFieldSettingsImpl instance) =>
    <String, dynamic>{
      'labelText': instance.labelText,
      'onOffType': _$BooleanFieldOnOffTypeEnumMap[instance.onOffType],
      'onOffPosition': _$ListTileControlAffinityEnumMap[instance.onOffPosition],
    };

const _$BooleanFieldOnOffTypeEnumMap = {
  BooleanFieldOnOffType.checkbox: 'checkbox',
  BooleanFieldOnOffType.switchButton: 'switchButton',
};

const _$ListTileControlAffinityEnumMap = {
  ListTileControlAffinity.leading: 'leading',
  ListTileControlAffinity.trailing: 'trailing',
  ListTileControlAffinity.platform: 'platform',
};

_$MapFieldSettingsImpl _$$MapFieldSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$MapFieldSettingsImpl(
      labelText: json['labelText'] as String?,
    );

Map<String, dynamic> _$$MapFieldSettingsImplToJson(
        _$MapFieldSettingsImpl instance) =>
    <String, dynamic>{
      'labelText': instance.labelText,
    };

_$SelectStringFieldSettingsImpl _$$SelectStringFieldSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectStringFieldSettingsImpl(
      labelText: json['labelText'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      displayMode: $enumDecodeNullable(
          _$SelectFieldDisplayModeEnumMap, json['displayMode']),
    );

Map<String, dynamic> _$$SelectStringFieldSettingsImplToJson(
        _$SelectStringFieldSettingsImpl instance) =>
    <String, dynamic>{
      'labelText': instance.labelText,
      'values': instance.values,
      'displayMode': _$SelectFieldDisplayModeEnumMap[instance.displayMode],
    };

_$StringFieldSettingsImpl _$$StringFieldSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$StringFieldSettingsImpl(
      labelText: json['labelText'] as String?,
      action: $enumDecodeNullable(_$StringFieldActionEnumMap, json['action']),
      submitFormOnFieldSubmitted: json['submitFormOnFieldSubmitted'] as bool?,
      keyboardType: const TextInputTypeConverter()
          .fromJson(json['keyboardType'] as String?),
      obscureText: json['obscureText'] as bool?,
      autocorrect: json['autocorrect'] as bool?,
      autofillHints: (json['autofillHints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      autofocus: json['autofocus'] as bool?,
      textInputAction: $enumDecodeNullable(
          _$TextInputActionEnumMap, json['textInputAction']),
      textCapitalization: $enumDecodeNullable(
          _$TextCapitalizationEnumMap, json['textCapitalization']),
      maxLines: (json['maxLines'] as num?)?.toInt(),
      hintText: json['hintText'] as String?,
      invalidRegexMessage: json['invalidRegexMessage'] as String?,
    );

Map<String, dynamic> _$$StringFieldSettingsImplToJson(
        _$StringFieldSettingsImpl instance) =>
    <String, dynamic>{
      'labelText': instance.labelText,
      'action': _$StringFieldActionEnumMap[instance.action],
      'submitFormOnFieldSubmitted': instance.submitFormOnFieldSubmitted,
      'keyboardType':
          const TextInputTypeConverter().toJson(instance.keyboardType),
      'obscureText': instance.obscureText,
      'autocorrect': instance.autocorrect,
      'autofillHints': instance.autofillHints,
      'autofocus': instance.autofocus,
      'textInputAction': _$TextInputActionEnumMap[instance.textInputAction],
      'textCapitalization':
          _$TextCapitalizationEnumMap[instance.textCapitalization],
      'maxLines': instance.maxLines,
      'hintText': instance.hintText,
      'invalidRegexMessage': instance.invalidRegexMessage,
    };

const _$StringFieldActionEnumMap = {
  StringFieldAction.clear: 'clear',
  StringFieldAction.obscure: 'obscure',
};

const _$TextInputActionEnumMap = {
  TextInputAction.none: 'none',
  TextInputAction.unspecified: 'unspecified',
  TextInputAction.done: 'done',
  TextInputAction.go: 'go',
  TextInputAction.search: 'search',
  TextInputAction.send: 'send',
  TextInputAction.next: 'next',
  TextInputAction.previous: 'previous',
  TextInputAction.continueAction: 'continueAction',
  TextInputAction.join: 'join',
  TextInputAction.route: 'route',
  TextInputAction.emergencyCall: 'emergencyCall',
  TextInputAction.newline: 'newline',
};

const _$TextCapitalizationEnumMap = {
  TextCapitalization.words: 'words',
  TextCapitalization.sentences: 'sentences',
  TextCapitalization.characters: 'characters',
  TextCapitalization.none: 'none',
};
