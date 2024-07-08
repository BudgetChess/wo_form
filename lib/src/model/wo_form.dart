import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wo_form/wo_form.dart';

part 'wo_form.freezed.dart';
part 'wo_form.g.dart';

typedef OnSubmitErrorDef = void Function(
  BuildContext context,
  SubmitErrorStatus errorStatus,
);

typedef WoFormPageBuilderDef = Widget Function(BuildContext context);

@freezed
class WoForm with _$WoForm {
  const factory WoForm({
    @JsonKey(
      fromJson: WoFormElementMixin.fromJson,
      toJson: WoFormElementMixin.staticToJson,
    )
    required WoFormElementMixin child,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Future<void> Function(WoForm form, WoFormValues values)? onSubmitting,
    @JsonKey(includeToJson: false, includeFromJson: false)
    OnSubmitErrorDef? onSubmitError,
    @JsonKey(includeToJson: false, includeFromJson: false)
    void Function(BuildContext context)? onSubmitSuccess,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(InitialStatus())
    WoFormStatus initialStatus,
    @JsonKey(includeToJson: false, includeFromJson: false)
    Future<bool?> Function(BuildContext context)? canQuit,
    @JsonKey(toJson: WoFormUiSettings.staticToJson)
    @Default(WoFormUiSettings())
    WoFormUiSettings uiSettings,
    @JsonKey(includeToJson: false, includeFromJson: false)
    ThemeData Function(BuildContext context)? themeBuilder,
    @JsonKey(includeToJson: false, includeFromJson: false)
    WoFormPageBuilderDef? pageBuilder,
  }) = _WoForm;

  const WoForm._();

  factory WoForm.fromJson(Map<String, dynamic> json) => _$WoFormFromJson(json);

  // --

  Map<String, dynamic> initialValues() => {
        if (child is WoFormNodeMixin)
          ...(child as WoFormNodeMixin).initialValues(parentPath: '')
        else if (child is WoFormInputMixin)
          '/${child.id}': (child as WoFormInputMixin).initialValue,
      };

  Iterable<String> getAllInputPaths({required WoFormValues values}) =>
      child.getAllInputPaths(values: values, parentPath: '');

  Iterable<WoFormInputError> getErrors(WoFormValues values) =>
      child.getErrors(values, parentPath: '');

  /// The path of an input is the ids of it and its parents, separated by the
  /// character '/'.
  ///
  /// Exemple :
  ///
  /// InputsNode(
  ///   id: 'profile',
  ///   inputs: [
  ///     StringInput(
  ///       id: 'name',
  ///       ...
  ///
  /// The path of the input with id 'name' is '/profile/name'.
  WoFormElementMixin? getInput({
    required String path,
    Map<String, dynamic>? values,
  }) {
    if (!path.startsWith('/')) {
      throw ArgumentError('An input path must start with character "/".');
    }

    final slashIndex = path.substring(1).indexOf('/');

    if (slashIndex == -1) {
      return child.id == path.substring(1) ? child : null;
    }

    if (child is WoFormNodeMixin &&
        child.id == path.substring(1, slashIndex + 1)) {
      return (child as WoFormNodeMixin).getInput(
        path: path.substring(slashIndex + 1),
        parentPath: '',
        values: values,
      );
    }

    return null;
  }

  Map<String, dynamic> export(WoFormValues values) {
    final data = <String, dynamic>{};

    child.export(
      into: data,
      values: values,
      parentPath: '',
    );

    return data;
  }

  Widget toPage({Key? key}) => toWidget(key: key);

  Widget toWidget({Key? key}) => WoFormPageBuilder(key: key, form: this);
}
