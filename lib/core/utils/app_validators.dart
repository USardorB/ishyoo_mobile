import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'shared.validation.required'.tr();
    }
    return null;
  }

  static String? email(String? value, {bool isRequired = true}) {
    if (value == null || value.trim().isEmpty) {
      return isRequired ? 'shared.validation.required'.tr() : null;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'shared.validation.invalidEmail'.tr();
    }
    return null;
  }

  static String? password(String? value, {bool isRequired = true}) {
    if (value == null || value.trim().isEmpty) {
      return isRequired ? 'shared.validation.required'.tr() : null;
    }
    if (value.length < 8) {
      return 'shared.validation.passwordLength'.tr();
    }
    return null;
  }

  static String? url(String? value, {bool isRequired = false}) {
    if (value == null || value.trim().isEmpty) {
      return isRequired ? 'shared.validation.required'.tr() : null;
    }
    final urlRegex = RegExp(
      r'^https?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?$',
    );
    if (!urlRegex.hasMatch(value)) {
      return 'shared.validation.invalidUrl'.tr();
    }
    return null;
  }
}
