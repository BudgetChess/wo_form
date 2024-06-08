import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wo_form/wo_form.dart';

part 'input.freezed.dart';
part 'input.g.dart';

@freezed
sealed class WoFormInputError with _$WoFormInputError {
  const factory WoFormInputError.empty({
    required String inputId,
  }) = EmptyInputError;

  const factory WoFormInputError.invalid({
    required String inputId,
  }) = InvalidInputError;

  const factory WoFormInputError.maxBound({
    required String inputId,
  }) = MaxBoundInputError;

  const factory WoFormInputError.minBound({
    required String inputId,
  }) = MinBoundInputError;
}

mixin WoFormInputMixin {
  Object? get defaultValue;

  WoFormInputError? getError(Object? value);

  String? getInvalidExplanation(Object? value, FormLocalizations formL10n);

  Widget toField<T extends WoFormValuesCubit>({required String parentPath});

  Widget toWidget<C extends WoFormValuesCubit>({required String parentPath}) =>
      toField(parentPath: parentPath);

  // WoFormElementMixin

  String get id;

  Map<String, dynamic> toJson();

  /// When a parent of this element will jsonify, this method will take an
  /// object (the value from the form fulfillment) and return a json value.
  Object? valueToJson(Object? value);
}

@freezed
sealed class WoFormInput
    with _$WoFormInput, WoFormElementMixin, WoFormInputMixin {
  const factory WoFormInput.boolean({
    required String id,
    bool? defaultValue,
    @Default(false) bool isRequired,
    @JsonKey(toJson: BooleanFieldSettings.staticToJson)
    @Default(BooleanFieldSettings())
    BooleanFieldSettings uiSettings,
  }) = BooleanInput;

  @Assert(
    'maxBound == null || minBound <= maxBound',
    'maxBound must be higher or equal to minBound',
  )
  const factory WoFormInput.num({
    required String id,
    num? defaultValue,
    @Default(false) bool isRequired,
    int? maxBound,
    @Default(0) int minBound,
    @Default(NumFieldSettings()) NumFieldSettings uiSettings,
  }) = NumInput;

  @Assert(
    'maxCount == null || minCount <= maxCount',
    'maxCount must be higher or equal to minCount',
  )
  const factory WoFormInput.selectString({
    required String id,
    required int? maxCount,
    @Default([]) List<String> defaultValue,
    @Default([]) List<String> availibleValues,
    @Default(0) int minCount,
    @Default(SelectFieldSettings<String>())
    SelectFieldSettings<String> uiSettings,
  }) = SelectStringInput;

  const factory WoFormInput.string({
    required String id,
    String? defaultValue,
    @Default(false) bool isRequired,
    String? regexPattern,
    @JsonKey(toJson: StringFieldSettings.staticToJson)
    @Default(StringFieldSettings())
    StringFieldSettings uiSettings,
  }) = StringInput;

  const WoFormInput._();

  factory WoFormInput.fromJson(Map<String, dynamic> json) =>
      _$WoFormInputFromJson(json);

  // --

  @override
  WoFormInputError? getError(dynamic value) {
    switch (this) {
      case BooleanInput(isRequired: final isRequired):
        return isRequired && value != true
            ? WoFormInputError.empty(inputId: id)
            : null;

      case NumInput(
          isRequired: final isRequired,
          minBound: final minBound,
          maxBound: final maxBound,
        ):
        value as num?;

        if (value == null) {
          return isRequired ? WoFormInputError.empty(inputId: id) : null;
        }

        if (value < minBound) return WoFormInputError.minBound(inputId: id);
        if (maxBound != null && value > maxBound) {
          return WoFormInputError.maxBound(inputId: id);
        }

        return null;

      case StringInput(
          isRequired: final isRequired,
          regexPattern: final regexPattern,
        ):
        value as String?;

        if (value == null || value.isEmpty) {
          return isRequired ? WoFormInputError.empty(inputId: id) : null;
        } else if (regexPattern != null &&
            !RegExp(regexPattern).hasMatch(value)) {
          return WoFormInputError.invalid(inputId: id);
        } else {
          return null;
        }

      case SelectStringInput(
          id: final inputId,
          availibleValues: final availibleValues,
          minCount: final minCount,
          maxCount: final maxCount,
        ):
        return SelectInput._validator(
          inputId: inputId,
          selectedValues: (value as List<String>?) ?? [],
          availibleValues: availibleValues,
          minCount: minCount,
          maxCount: maxCount,
        );
    }
  }

  @override
  String? getInvalidExplanation(dynamic value, FormLocalizations formL10n) {
    final error = getError(value);

    if (error == null) return null;

    switch (this) {
      case BooleanInput():
      case NumInput():
      case SelectStringInput():
        break;

      case StringInput(
          regexPattern: final regexPattern,
          uiSettings: final uiSettings,
        ):
        if (error is InvalidInputError && regexPattern != null) {
          return uiSettings.invalidRegexMessage;
        }
    }

    final errorType = error.runtimeType.toString();
    return formL10n.formError(errorType.substring(2, errorType.length - 4));
  }

  @override
  Widget toField<T extends WoFormValuesCubit>({required String parentPath}) {
    final path = '$parentPath/$id';
    switch (this) {
      case BooleanInput():
        return BooleanField(inputPath: path);
      case NumInput():
        return NumField(inputPath: path);
      case StringInput():
        return StringField(inputPath: path);
      case SelectStringInput():
        return SelectStringField(inputPath: path);
    }
  }

  @override
  Object? valueToJson(dynamic value) => switch (this) {
        BooleanInput() => value as bool?,
        NumInput() => value as num?,
        SelectStringInput(maxCount: final maxCount) =>
          SelectInput._selectedValuesToJson(
            selectedValues: value as List<String>?,
            toJsonT: (value) => value,
            asList: maxCount != 1,
          ),
        StringInput() => value as String?,
      };
}

@freezed
@JsonSerializable(genericArgumentFactories: true)
class SelectInput<T>
    with _$SelectInput<T>, WoFormElementMixin, WoFormInputMixin {
  const factory SelectInput({
    required String id,
    required int? maxCount,
    @Default(0) int minCount,
    @Default([]) List<T> defaultValues,
    @Default([]) List<T> availibleValues,
    SelectFieldSettings<T>? uiSettings,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Object? Function(T)? toJsonT,
  }) = _SelectInput<T>;

  const SelectInput._();

  factory SelectInput.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$SelectInputFromJson(json, fromJsonT);
  }

  @override
  Map<String, dynamic> toJson() {
    if (toJsonT == null) return _$SelectInputToJson(this, _defaultToJsonT<T>);

    return _$SelectInputToJson(this, toJsonT!);
  }

  // defaultValue can't be set from the constructor, because it has
  // a type parameter (obscure restrictions)
  @override
  List<T> get defaultValue => defaultValues;

  // --

  static WoFormInputError? _validator<T>({
    required String inputId,
    required List<T> selectedValues,
    required List<T> availibleValues,
    required int minCount,
    required int? maxCount,
  }) {
    if (minCount == 1 && maxCount == 1 && selectedValues.isEmpty) {
      return WoFormInputError.empty(inputId: inputId);
    }

    if (selectedValues.length < minCount) {
      return WoFormInputError.minBound(inputId: inputId);
    }

    if (maxCount != null && selectedValues.length > maxCount) {
      return WoFormInputError.maxBound(inputId: inputId);
    }

    if (availibleValues.isNotEmpty) {
      for (final value in selectedValues) {
        if (!availibleValues.contains(value)) {
          return WoFormInputError.invalid(inputId: inputId);
        }
      }
    }

    return null;
  }

  static Object? _selectedValuesToJson<T>({
    required List<T>? selectedValues,
    required Object? Function(T)? toJsonT,
    required bool asList,
  }) {
    if (selectedValues == null) return null;

    final valuesToJson = selectedValues.map(toJsonT ?? _defaultToJsonT);

    return asList ? valuesToJson.toList() : valuesToJson.firstOrNull;
  }

  @override
  WoFormInputError? getError(dynamic value) => _validator(
        inputId: id,
        selectedValues: (value as List<T>?) ?? [],
        availibleValues: availibleValues,
        minCount: minCount,
        maxCount: maxCount,
      );

  @override
  String? getInvalidExplanation(dynamic value, FormLocalizations formL10n) {
    // TODO : replace formL10n by function of type
    // String? Function(WoFormInputError)
    // Is it possible ?

    final error = getError(value);

    if (error == null) return null;

    final errorType = error.runtimeType.toString();
    return formL10n.formError(errorType.substring(2, errorType.length - 4));
  }

  @override
  Widget toField<C extends WoFormValuesCubit>({required String parentPath}) =>
      SelectField<T>(inputPath: '$parentPath/$id');

  @override
  Object? valueToJson(dynamic value) => _selectedValuesToJson<T>(
        selectedValues: value as List<T>?,
        toJsonT: toJsonT,
        asList: maxCount != 1,
      );
}

Object? _defaultToJsonT<T>(T value) {
  if (value is String || value is bool || value is num) {
    return value;
  } else if (value is Enum) {
    return (value as Enum).name;
  }

  throw UnimplementedError('No toJsonT provided for <$T>');
}
