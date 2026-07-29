import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/enums/app_languages.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ChooseLanguageSheet extends StatefulWidget {
  const ChooseLanguageSheet({super.key});

  @override
  State<ChooseLanguageSheet> createState() => _ChooseLanguageSheetState();
}

class _ChooseLanguageSheetState extends State<ChooseLanguageSheet> {
  late AppLanguages _selectedLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage = AppLanguages.fromLocale(context.locale);
  }

  void _applyLanguage() {
    context.setLocale(_selectedLanguage.locale);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 60,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.bgTertiary.withValues(alpha: .75),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              Text(
                "settings.language",
                style: context.textThemes.h5,
              ).tr(),
              IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.close),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
        ...ListTile.divideTiles(
          context: context,
          tiles: AppLanguages.values.map(
            (lang) => ListTile(
              onTap: () => setState(() => _selectedLanguage = lang),
              leading: const Icon(Icons.language),
              title: Text(
                lang.title,
                style: context.textThemes.b2,
              ),
              subtitle: Text(
                lang.subtitle,
                style: context.textThemes.c1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              trailing: Icon(
                _selectedLanguage == lang
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: _selectedLanguage == lang
                    ? context.colors.brandDefault
                    : context.colors.textSecondary,
              ),
            ),
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: AppButton(
            onTap: _applyLanguage,
            label: "shared.apply".tr(),
          ),
        ),
      ],
    );
  }
}
