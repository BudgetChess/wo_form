import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wo_form/wo_form.dart';

part 'status.freezed.dart';

@freezed
sealed class WoFormStatus with _$WoFormStatus {
  const factory WoFormStatus.idle() = IdleStatus;
  const factory WoFormStatus.invalidValues({
    Iterable<WoFormInputError>? inputErrors,
  }) = InvalidValuesStatus;
  const factory WoFormStatus.submitting() = SubmittingStatus;
  const factory WoFormStatus.submitError({
    Object? error,
    StackTrace? stackTrace,
  }) = SubmitErrorStatus;
  const factory WoFormStatus.submitted() = SubmittedStatus;
}