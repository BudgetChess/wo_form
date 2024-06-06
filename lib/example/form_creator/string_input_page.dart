import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_atomic_design/package_atomic_design.dart';
import 'package:wo_form/example/form_creator/string_input_form.dart';
import 'package:wo_form/example/utils/readable_json.dart';
import 'package:wo_form/wo_form.dart';

class StringInputPage extends StatelessWidget {
  const StringInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WoFormInitializer(
      form: stringInputForm,
      onSubmitting: () {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Création d'un champ texte"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              ...stringInputForm.inputs.map(
                (e) => e.toWidget(parentPath: null),
              ),
              WoGap.xxxlarge,
              const Text('Json :'),
              WoGap.medium,
              BlocBuilder<WoFormValuesCubit, Map<String, dynamic>>(
                builder: (context, values) {
                  return Text(
                    readableJson(stringInputForm.valueToJson(values)),
                  );
                },
              ),
              WoGap.xxxlarge,
              BlocListener<WoFormStatusCubit, WoFormStatus>(
                listener: (context, status) {
                  if (status is SubmittedStatus) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const ScreenB(),
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
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
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

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: const Center(
        child: Text('Welcome to Screen B'),
      ),
    );
  }
}
