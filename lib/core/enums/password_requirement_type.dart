import 'package:easy_localization/easy_localization.dart';

enum PasswordRequirementType {
  minLength,
  hasCapitalLetter,
  hasNumber,
  ;

  String get text {
    switch (this) {
      case PasswordRequirementType.minLength:
        return 'auth.confirmPassword.requirements.minLength'.tr();
      case PasswordRequirementType.hasCapitalLetter:
        return 'auth.confirmPassword.requirements.capitalLetter'.tr();
      case PasswordRequirementType.hasNumber:
        return 'auth.confirmPassword.requirements.number'.tr();
    }
  }
}
