import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wo_form/wo_form.dart';

class DateTimeField extends StatelessWidget {
  const DateTimeField(this.data, {super.key});

  final WoFieldData<DateTimeInput, DateTime?, DateTimeInputUiSettings> data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputDecorationTheme = theme.inputDecorationTheme;
    final themedBorder = inputDecorationTheme.border;

    final now = DateTime.now();
    final firstDate = data.input.minBound?.resolve() ??
        DateTime(now.year - 2, now.month, now.day);
    final lastDate = data.input.maxBound?.resolve() ??
        DateTime(now.year + 2, now.month, now.day);
    final initialDate = data.value == null ||
            data.value!.isBefore(firstDate) ||
            data.value!.isAfter(lastDate)
        ? null
        : data.value;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        data.uiSettings.labelText ?? '',
        style: inputDecorationTheme.labelStyle,
      ),
      subtitle: data.errorText != null
          ? Text(
              data.errorText!,
              style: inputDecorationTheme.errorStyle ??
                  theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.error),
            )
          : (data.uiSettings.helperText ?? '').isNotEmpty
              ? Text(
                  data.uiSettings.helperText ?? '',
                  style: inputDecorationTheme.helperStyle ??
                      theme.textTheme.labelMedium,
                )
              : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (initialDate != null && data.input.isRequired == false)
            IconButton(
              onPressed: data.onValueChanged == null
                  ? null
                  : () => data.onValueChanged!(null),
              icon: const Icon(Icons.close),
            ),
          InkWell(
            borderRadius: themedBorder is OutlineInputBorder
                ? themedBorder.borderRadius
                : themedBorder is UnderlineInputBorder
                    ? themedBorder.borderRadius
                    : BorderRadius.zero,
            onTap: data.onValueChanged == null
                ? null
                : () async {
                    final pickDate = data.uiSettings.pickDate ??
                        WoFormTheme.of(context)?.pickDate ??
                        _defaultPickDate;

                    final selectedDate = await pickDate(
                      context: context,
                      initialDate: initialDate == null ||
                              initialDate.isBefore(firstDate) ||
                              initialDate.isAfter(lastDate)
                          ? null
                          : initialDate,
                      minBound: data.input.minBound?.resolve() ??
                          DateTime(now.year - 2, now.month, now.day),
                      maxBound: data.input.maxBound?.resolve() ??
                          DateTime(now.year + 2, now.month, now.day),
                      initialEntryMode: data.uiSettings.initialEntryMode ??
                          DatePickerEntryMode.calendar,
                    );

                    if (selectedDate != null) {
                      data.onValueChanged!(selectedDate);
                    }
                  },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                border: Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: initialDate == null
                  ? const Icon(Icons.calendar_month)
                  : Text(DateFormat.yMMMMd().format(initialDate)),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _defaultPickDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? maxBound,
    DateTime? minBound,
    DatePickerEntryMode? initialEntryMode,
  }) {
    final now = DateTime.now();

    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minBound ?? DateTime(now.year, now.month - 1),
      lastDate: maxBound ?? DateTime(now.year + 1, now.month),
      initialEntryMode: initialEntryMode ?? DatePickerEntryMode.calendar,
    );
  }
}
