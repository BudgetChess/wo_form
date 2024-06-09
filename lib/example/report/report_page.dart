import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_atomic_design/package_atomic_design.dart';
import 'package:wo_form/example/utils/readable_json.dart';
import 'package:wo_form/wo_form.dart';

enum ReportType {
  verbalAbuse,
  cheating,
  fairPlay,
  other;
}

class ReportForm {
  static const typeId = 'type';
  static const typePath = '/type';

  static const messageId = 'message';
  static const messagePath = '/message';

  static const blockId = 'block';
  static const blockPath = '/block';
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WoPadding.allMedium(
        child: WoForm(
          unmodifiableValuesJson: {
            'reporterId': 'me',
            'reportedId': 'him',
          },
          uiSettings: const WoFormUiSettings(
            titleText: 'Signaler un utilisateur',
            submitText: 'Envoyer',
            displayMode: WoFormDisplayMode.card,
            submitMode: WoFormSubmitMode.submitIfValid,
          ),
          inputs: [
            SelectInput<ReportType>(
              id: ReportForm.typeId,
              availibleValues: ReportType.values,
              minCount: 1,
              maxCount: 1,
              uiSettings: SelectFieldSettings(
                labelText: 'De quoi accusez-vous cette raclure ?',
                displayMode: SelectFieldDisplayMode.tile,
                valueBuilder: (type) => Text(
                  switch (type) {
                    null => 'Vide',
                    ReportType.cheating => 'Triche',
                    ReportType.fairPlay => 'Fair play',
                    ReportType.verbalAbuse => 'Violence verbale',
                    ReportType.other => 'Autre',
                  },
                ),
              ),
            ),
            const StringInput(
              id: ReportForm.messageId,
              uiSettings: StringFieldSettings(
                hintText: 'Dites-en plus !',
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
              ),
            ),
            const BooleanInput(
              id: ReportForm.blockId,
              uiSettings: BooleanFieldSettings(
                labelText: 'Bloquer cette raclure ?',
                onOffType: BooleanFieldOnOffType.checkbox,
              ),
            ),
          ],
        ).toWidget(
          onSubmitting: (_) async {
            await Future<void>.delayed(const Duration(seconds: 3));
          },
          onSubmitted: (context) {
            final form = context.read<WoForm>();
            final values = context.read<WoFormValuesCubit>().state;
            showActionDialog(
              pageContext: context,
              title: "Ce json vient d'être envoyé.",
              actionText: 'Ok',
              onAction: context.read<WoFormStatusCubit>().setIdle,
              content: Text(readableJson(form.exportValues(values))),
            );
          },
        ),
      ),
    );
  }
}
