import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_atomic_design/package_atomic_design.dart';
import 'package:wo_form/example/form_creator/num_input_node.dart';
import 'package:wo_form/example/form_creator/string_input_node.dart';
import 'package:wo_form/example/utils/readable_json.dart';
import 'package:wo_form/wo_form.dart';

final idGenerator = Random();

extension RandomX on Random {
  String generateId() => nextDouble().toString().substring(2);
}

final woFormCreator = WoForm(
  unmodifiableValuesJson: {
    'uiSettings': {
      'title': 'Profil',
    },
  },
  inputs: [
    InputsNode(
      id: 'inputs',
      exportType: NodeExportType.list,
      uiSettings: const NodeWidgetSettings(
        displayMode: NodeDisplayMode.tile,
      ),
      inputs: [
        createStringInputNode(id: idGenerator.generateId()),
        createNumInputNode(id: idGenerator.generateId()),
      ],
    ),
  ],
);

class StringInputPage extends StatelessWidget {
  const StringInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WoFormInitializer(
      form: woFormCreator,
      onSubmitting: () {},
      child: Scaffold(
        // backgroundColor: context.colorScheme.contrastedBackground,
        appBar: AppBar(
          title: const Text('Créer un formulaire'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              ...woFormCreator.inputs.map((e) => e.toWidget(parentPath: '')),
              WoGap.xxxlarge,
              ExpansionTile(
                title: const Text('JSON'),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<WoFormValuesCubit, Map<String, dynamic>>(
                    builder: (context, values) {
                      return Text(
                        readableJson(woFormCreator.valueToJson(values)),
                      );
                    },
                  ),
                ],
              ),
              WoGap.xxxlarge,
              BlocListener<WoFormStatusCubit, WoFormStatus>(
                listener: (context, status) {
                  if (status is SubmittedStatus) {
                    final WoForm form;
                    try {
                      form = WoForm.fromJson(
                        woFormCreator.valueToJson(
                          context.read<WoFormValuesCubit>().state,
                        ),
                      );
                    } catch (e) {
                      snackBarError(context, e.toString());
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) {
                          return CreatedFormPage(initialForm: form);
                        },
                      ),
                    );
                  }
                },
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: context.read<WoFormValuesCubit>().submit,
                      style: IconButton.styleFrom(
                        backgroundColor: context.colorScheme.primary,
                        foregroundColor: context.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size(64, 64),
                      ),
                    );
                  },
                ),
              ),
              WoGap.xxxlarge,
            ],
          ),
        ),
      ),
    );
  }
}

class CreatedFormPage extends StatelessWidget {
  const CreatedFormPage({
    required this.initialForm,
    super.key,
  });

  final WoForm initialForm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilisation du formulaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: initialForm.toWidget(
          onSubmitting: () {},
          onSubmitted: (context) {
            final form = context.read<WoForm>();
            final values = context.read<WoFormValuesCubit>().state;
            showActionDialog(
              pageContext: context,
              title: 'JSON',
              actionText: 'Ok',
              onAction: context.read<WoFormStatusCubit>().setIdle,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(readableJson(form.valueToJson(values))),
                  // WoGap.large,
                  // Text(readableJson(form.toJson())),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
