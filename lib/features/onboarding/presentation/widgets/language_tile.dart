import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/enums/app_languages.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class LanguageTile extends StatelessWidget {
  final AppLanguages value;
  final bool isSelected;
  final void Function(AppLanguages value) onSelect;

  const LanguageTile({
    super.key,
    required this.value,
    required this.onSelect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onSelect(value),
      child: Ink(
        decoration: ShapeDecoration(
          color: context.colors.bgPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected
                ? BorderSide(color: context.colors.brandDefault)
                : BorderSide.none,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/vectors/${switch (value) {
                  AppLanguages.uzLat => 'UZ.svg',
                  AppLanguages.uzKr => 'UZ.svg',
                  AppLanguages.ru => 'RU.svg',
                  AppLanguages.en => 'US.svg',
                }}',
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value.title,
                    style: context.textThemes.buttonLarge,
                  ),
                  Text(
                    value.subtitle,
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: isSelected
                    ? context.colors.brandDefault
                    : context.colors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
