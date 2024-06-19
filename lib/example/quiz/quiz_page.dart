import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_atomic_design/package_atomic_design.dart';
import 'package:wo_form/example/utils/readable_json.dart';
import 'package:wo_form/wo_form.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WoForm(
      themeBuilder: (context) => Theme.of(context).copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearTrackColor: Colors.transparent,
        ),
      ),
      canModifySubmittedValues: false,
      uiSettings: WoFormUiSettings(
        showAsteriskIfRequired: false,
        submitMode: const PageByPageSubmitMode(
          submitText: 'Terminer',
        ),
        submitButtonBuilder: (data) => Builder(
          builder: (context) {
            final form = context.read<WoForm>();
            final currentInput = form.inputs[data.pageIndex];

            final inputIsLocked = context.select(
              (WoFormLockCubit c) =>
                  c.inputIsLocked(inputPath: '/${currentInput.id}'),
            );

            return [0, 2].contains(data.pageIndex) && !inputIsLocked
                ? const SizedBox.shrink()
                : WoFormTheme.of(context)?.submitButtonBuilder?.call(data) ??
                    SubmitButton(data: data);
          },
        ),
      ),
      inputs: [
        InputsNode(
          id: 'q1-page',
          exportSettings: const ExportSettings(
            exportType: ExportType.firstExportable,
          ),
          inputs: [
            WidgetNode(
              id: 'header',
              builder: (context) =>
                  const QuizQuestion('De quelle couleur est le soleil ?'),
            ),
            const SelectStringInput(
              id: 'q1',
              maxCount: 1,
              minCount: 1,
              availibleValues: ['Bleu', 'Rouge', 'Vert', 'Jaune'],
              uiSettings: SelectInputUiSettings(
                hintText: 'Sélectionner une réponse',
                // displayMode: SelectFieldDisplayMode.chip,
                submitFormOnSelect: true,
              ),
            ),
          ],
        ),
        ValueBuilderNode(
          id: 'a1',
          inputPath: '../q1-page/q1',
          builder: (id, value) {
            return WidgetNode(
              id: id,
              builder: (context) => QuizAnswer(
                choice: (value as List<String>?)?.firstOrNull,
                answer: 'Jaune',
                explanation: 'Le Soleil est une étoile comme celles qu’on voit'
                    ' briller la nuit, mais c’est la plus proche de '
                    'la Terre. Une étoile est une énorme boule de gaz'
                    ' très chaud, qui produit énormément d’énergie. '
                    'Et cette énergie émerge'
                    ' de la surface sous forme de lumière.',
              ),
            );
          },
        ),
        InputsNode(
          id: 'q2-page',
          exportSettings: const ExportSettings(
            exportType: ExportType.firstExportable,
          ),
          inputs: [
            WidgetNode(
              id: 'header',
              builder: (context) =>
                  const QuizQuestion("Quelle est l'hypothénuse de x ?"),
            ),
            SelectStringInput(
              id: 'q2',
              maxCount: 1,
              minCount: 1,
              availibleValues: [
                'A',
                'B',
                'C',
              ],
              uiSettings: SelectInputUiSettings(
                displayMode: SelectFieldDisplayMode.tile,
                submitFormOnSelect: true,
                valueBuilder: (value) => Text(
                  switch (value) {
                    'A' => '√2',
                    'B' => '0',
                    'C' => 'Elle veut rien dire ta question',
                    _ => 'Elle veut rien dire ta question',
                  },
                ),
              ),
            ),
          ],
        ),
        ValueBuilderNode(
          id: 'a2',
          inputPath: '../q2-page/q2',
          builder: (id, value) {
            return WidgetNode(
              id: id,
              builder: (context) => QuizAnswer(
                choice: (value as List<String>?)?.firstOrNull,
                answer: 'C',
                explanation: "L'hypothénuse est en réalité la face cachée de "
                    'la Lune...',
              ),
            );
          },
        ),
        InputsNode(
          id: 'q3-page',
          exportSettings: const ExportSettings(
            exportType: ExportType.firstExportable,
          ),
          inputs: [
            WidgetNode(
              id: 'header',
              builder: (context) =>
                  const QuizQuestion('Quel est le record du monde de jonglage, '
                      'avec un ballon de foot, sans interruption ?'),
            ),
            const NumInput(
              id: 'q3',
              defaultValue: 0,
              isRequired: true,
            ),
          ],
        ),
        ValueBuilderNode(
          id: 'a3',
          inputPath: '../q3-page/q3',
          builder: (id, value) {
            return WidgetNode(
              id: id,
              builder: (context) => QuizAnswer(
                choice: value as num?,
                answer: 170515,
                explanation:
                    'Le record du monde actuel de jonglage avec un ballon de '
                    "football est détenu par l'athlète japonais Yuki Kadono. "
                    'En 2018, il a réalisé 170 515 jongles en une seule '
                    'session, battant ainsi le record précédent qui était de '
                    '170 405 jongles. Ce record a été officiellement '
                    'enregistré par Guinness World Records.',
              ),
            );
          },
        ),
        InputsNode(
          id: 'q4-page',
          exportSettings: const ExportSettings(
            exportType: ExportType.firstExportable,
          ),
          inputs: [
            WidgetNode(
              id: 'header',
              builder: (context) =>
                  const QuizQuestion('Quel est votre prénom ?'),
            ),
            const StringInput(
              id: 'q4',
              isRequired: true,
              uiSettings: StringInputUiSettings(autofocus: true),
            ),
          ],
        ),
        ValueBuilderNode(
          id: 'r4',
          inputPath: '../q4-page/q4',
          builder: (id, value) {
            return WidgetNode(
              id: id,
              builder: (context) => QuizAnswer(
                choice: value as String?,
                answer: value,
                explanation: 'Un prénom est personnel, propre à chacun et sale'
                    ' aux autres.',
              ),
            );
          },
        ),
        InputsNode(
          id: 'q5-page',
          exportSettings: const ExportSettings(
            exportType: ExportType.firstExportable,
          ),
          inputs: [
            WidgetNode(
              id: 'header',
              builder: (context) => const QuizQuestion(
                "J'ai vu et je reconnais que le package wo_form est un package"
                ' extraordinaire et très utile.',
              ),
            ),
            const BooleanInput(
              id: 'q5',
              uiSettings: BooleanInputUiSettings(
                controlType: BooleanFieldControlType.checkbox,
              ),
            ),
          ],
        ),
        ValueBuilderNode(
          id: 'r5',
          inputPath: '../q5-page/q5',
          builder: (id, value) {
            return WidgetNode(
              id: id,
              builder: (context) => QuizAnswer(
                choice: value as bool?,
                answer: true,
                explanation: 'Le package wo_form vous permet tout ce dont vous '
                    'avez besoin pour tout type de formulaire, de '
                    "l'éditeur au questionnaire, en fournissant des"
                    ' fonctionnalités avancées telles que le thème,'
                    ' les champs dynamiques, la jsonification...',
              ),
            );
          },
        ),
      ],
      onSubmitSuccess: showJsonDialog,
    ).toPage();
  }
}

class QuizQuestion extends StatelessWidget {
  const QuizQuestion(this.question, {super.key});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          question,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class QuizAnswer<T> extends StatelessWidget {
  const QuizAnswer({
    required this.choice,
    required this.answer,
    this.explanation,
    super.key,
  });

  final T choice;
  final T answer;
  final String? explanation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            choice == answer ? 'Bonne réponse !' : 'Dommage...',
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          if (choice != answer) ...[
            Decorated(
              color: Colors.red,
              icon: Icons.cancel,
              child: Text(choice.toString()),
            ),
            const SizedBox(height: 16),
          ],
          Decorated(
            color: Colors.green,
            icon: Icons.check_circle,
            child: Text(answer.toString()),
          ),
          const SizedBox(height: 32),
          if (explanation != null)
            Text(
              explanation!,
              textAlign: TextAlign.justify,
            ),
        ],
      ),
    );
  }
}

class Decorated extends StatelessWidget {
  const Decorated({
    required this.child,
    required this.color,
    this.icon,
    super.key,
  });

  final Widget child;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: color),
        ),
        prefixIcon: icon == null ? null : Icon(icon, color: color),
      ),
      child: child,
    );
  }
}
