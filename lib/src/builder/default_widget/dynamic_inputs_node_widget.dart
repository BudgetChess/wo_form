import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wo_form/wo_form.dart';

extension RandomX on Random {
  String _generateUid({int length = 6}) {
    const chars = '0123456789'
        'abcdefghijklmnopqrstuvwxyz'
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return List<String>.generate(length, (_) => chars[nextInt(chars.length)])
        .join();
  }
}

class DynamicInputsNodeWidget extends StatelessWidget {
  const DynamicInputsNodeWidget(this.data, {super.key});

  final WoFieldData<DynamicInputsNode, List<WoFormElementMixin>,
      DynamicInputsNodeUiSettings> data;

  @override
  Widget build(BuildContext context) {
    void onAddChoice(WoFormElementMixin inputFromTemplate) {
      final input = inputFromTemplate.withId(
        id: (data.uiSettings.generateId ??
                WoFormTheme.of(context)?.generateId ??
                Random()._generateUid)
            .call(),
      );

      data.onValueChanged?.call(List.from(data.value ?? [])..add(input));

      final form = context.read<WoForm>();
      final valuesCubit = context.read<WoFormValuesCubit>();
      final values = valuesCubit.state;
      for (final inputPath in input.getAllInputPaths(
        values: values,
        parentPath: data.inputPath,
      )) {
        final input = form.getInput(path: inputPath, values: values);
        if (input is WoFormInputMixin) {
          valuesCubit.onValueChanged(
            inputPath: inputPath,
            value: (input! as WoFormInputMixin).initialValue,
          );
        }
      }
    }

    if (data.input.templates.isEmpty) return const SizedBox.shrink();

    final addButton = data.input.templates.length == 1
        ? IconButton.filled(
            onPressed: data.onValueChanged == null
                ? null
                : () => onAddChoice(data.input.templates.first.input),
            icon: const Icon(Icons.add),
            color: Theme.of(context).colorScheme.onPrimary,
          )
        : SearchField<DynamicInputTemplate>.multipleChoices(
            values: data.input.templates,
            onSelected: data.onValueChanged == null
                ? null
                : (template) => onAddChoice(template.input),
            valueBuilder: (template) =>
                Text(template?.uiSettings.labelText ?? ''),
            helpValueBuilder: (template) =>
                (template.uiSettings.helperText ?? '').isEmpty
                    ? null
                    : Text(template.uiSettings.helperText ?? ''),
            builder: (onPressed) => IconButton.filled(
              onPressed: onPressed,
              icon: const Icon(Icons.add),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          );

    final headerData = WoFormInputHeaderData(
      labelText: data.uiSettings.labelText,
      helperText: data.uiSettings.helperText,
      trailing: addButton,
      shrinkWrap: false,
    );

    return Column(
      children: [
        (WoFormTheme.of(context)?.inputHeaderBuilder ?? InputHeader.new)
            .call(headerData),
        ...?data.value?.map(
          (e) => DeletableField(
            onDelete: () => onRemoveChoice(e),
            child: WoFormElementBuilder(
              inputPath: '${data.inputPath}/${e.id}',
              key: Key(
                '${data.inputPath}/${e.id}',
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onRemoveChoice(WoFormElementMixin input) =>
      data.onValueChanged?.call(List.from(data.value ?? [])..remove(input));
}
