import 'package:easy_localization/easy_localization.dart';

enum PasswordRequirementType {
  minLength,
  hasCapitalLetter,
  hasNumber,
  ;

  String get text {
    switch (this) {
      case PasswordRequirementType.minLength:
        return 'auth.confirm_password.req_min_length'.tr();
      case PasswordRequirementType.hasCapitalLetter:
        return 'auth.confirm_password.req_capital_letter'.tr();
      case PasswordRequirementType.hasNumber:
        return 'auth.confirm_password.req_number'.tr();
    }
  }
}
