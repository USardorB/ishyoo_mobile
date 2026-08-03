import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/themes/theme_cubit.dart';

class ChooseThemeSheet extends StatefulWidget {
  const ChooseThemeSheet({super.key});

  @override
  State<ChooseThemeSheet> createState() => _ChooseThemeSheetState();
}

class _ChooseThemeSheetState extends State<ChooseThemeSheet> {
  static const _vectors = {
    ThemeMode.dark: "assets/vectors/dark_theme_card.svg",
    ThemeMode.light: "assets/vectors/light_theme_card.svg",
    ThemeMode.system: "assets/vectors/system_theme_card.svg",
  };

  late ThemeMode _selectedTheme;

  @override
  void initState() {
    super.initState();
    _selectedTheme = context.read<ThemeCubit>().state;
  }

  void _applyTheme() {
    context.read<ThemeCubit>().changeTheme(_selectedTheme);
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
                "settings.theme",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: List.generate(_vectors.length, (index) {
              final mode = _vectors.keys.elementAt(index);
              final isSelected = _selectedTheme == mode;
              final name = switch (mode) {
                ThemeMode.light => 'settings.lightMode'.tr(),
                ThemeMode.dark => 'settings.darkMode'.tr(),
                ThemeMode.system => 'settings.systemTheme'.tr(),
              };

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < _vectors.length - 1 ? 12.0 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTheme = mode),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: isSelected
                                  ? context.colors.brandDefault
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: SvgPicture.asset(
                            _vectors.values.elementAt(index),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          name,
                          style: context.textThemes.buttonMedium.copyWith(
                            color: isSelected
                                ? context.colors.textPrimary
                                : context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: AppButton(
            onTap: _applyTheme,
            label: "settings.actions.apply".tr(),
          ),
        ),
      ],
    );
  }
}
