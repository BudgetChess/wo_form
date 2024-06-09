import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wo_form/wo_form.dart';

class WoFormValueBuilder<T> extends StatelessWidget {
  const WoFormValueBuilder({
    required this.inputPath,
    required this.builder,
    super.key,
  });

  final String inputPath;
  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WoFormValuesCubit, Map<String, dynamic>, T?>(
      selector: (values) {
        final value = values[inputPath];
        if (value is! T?) {
          throw ArgumentError(
            'Expected <$T?> at inputId: "$inputPath", '
            'found: <${value.runtimeType}>',
          );
        }
        return value;
      },
      builder: builder,
    );
  }
}