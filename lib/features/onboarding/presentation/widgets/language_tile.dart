import 'package:flutter/material.dart';
import 'package:mobile/core/enums/app_languages.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/themes/app_colors.dart';

class LanguageTile<T extends AppLanguages> extends StatelessWidget {
  final T value;
  final bool isSelected;
  final void Function(T value) onSelect;
  const LanguageTile({
    super.key,
    required this.value,
    required this.onSelect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: .circular(12),
      onTap: () => onSelect(value),
      child: Ink(
        decoration: ShapeDecoration(
          color: context.colors.bgPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: .circular(12),
            side: isSelected
                ? BorderSide(color: appLightColors.brandDefault)
                : .none,
          ),
        ),
        child: Padding(
          padding: .all(12),
          child: Row(
            children: [
              Icon(Icons.flag),
              SizedBox(width: 8),
              Text(
                value.name,
                style: context.textThemes.buttonLarge,
              ),
              Spacer(),
              switch (isSelected) {
                false => Icon(Icons.radio_button_off),
                true => Icon(
                  Icons.radio_button_checked,
                  color: appLightColors.brandDefault,
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
