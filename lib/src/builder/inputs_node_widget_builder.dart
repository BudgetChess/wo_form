import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wo_form/wo_form.dart';

class InputsNodeWidgetBuilder extends StatelessWidget {
  const InputsNodeWidgetBuilder({
    required this.path,
    this.uiSettings,
    super.key,
  });

  final String path;
  final InputsNodeUiSettings? uiSettings;

  @override
  Widget build(BuildContext context) {
    final form = context.read<RootNode>();
    final values = context.read<WoFormValuesCubit>().state;

    final node = form.getChild(path: path, values: values);
    if (node is! InputsNode) {
      throw ArgumentError(
        'Expected <InputsNode> at path: "$path", '
        'found: <${node.runtimeType}>',
      );
    }

    final mergedSettings =
        uiSettings?.merge(node.uiSettings) ?? node.uiSettings;

    switch (mergedSettings.childrenVisibility) {
      case null:
      case ChildrenVisibility.always:
        final fieldData = WoFieldData(
          path: path,
          input: node,
          value: null,
          errorText: null,
          uiSettings: mergedSettings,
          onValueChanged: (_) {},
        );

        return (mergedSettings.widgetBuilder ??
                WoFormTheme.of(context)?.inputsNodeWidgetBuilder ??
                InputsNodeWidget.new)
            .call(fieldData);
      case ChildrenVisibility.whenAsked:
        final woFormL10n = context.read<WoFormL10n?>();

        return BlocSelector<WoFormStatusCubit, WoFormStatus, bool>(
          selector: (status) {
            return status is InvalidValuesStatus;
          },
          builder: (context, showError) {
            return BlocSelector<WoFormValuesCubit, Map<String, dynamic>,
                String?>(
              selector: (values) {
                return woFormL10n?.errors(
                  node
                      .getErrors(values: values, parentPath: path.parentPath)
                      .length,
                );
              },
              builder: (context, errorText) {
                final expanderData = WoFieldData(
                  path: path,
                  input: node,
                  value: null,
                  errorText: showError ? errorText : null,
                  uiSettings: mergedSettings,
                  onValueChanged: (_) {},
                );

                return (mergedSettings.expanderBuilder ??
                        WoFormTheme.of(context)?.inputsNodeExpanderBuilder ??
                        InputsNodeExpander.new)
                    .call(expanderData);
              },
            );
          },
        );
    }
  }
}
