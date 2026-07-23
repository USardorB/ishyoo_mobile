import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

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

  ThemeMode _selectedTheme = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        Align(
          child: Container(
            margin: .symmetric(vertical: 12),
            width: 60,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.bgTertiary.withValues(alpha: .75),
              borderRadius: .circular(6),
            ),
          ),
        ),
        Padding(
          padding: .symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              SizedBox(width: 40),
              Text(
                "Ilova mavzusi",
                style: context.textThemes.h5,
              ),
              IconButton(
                onPressed: context.pop,
                icon: Icon(Icons.close),
                padding: .zero,
                visualDensity: .compact,
              ),
            ],
          ),
        ),

        Padding(
          padding: .symmetric(horizontal: 16, vertical: 12),
          child: Row(
            spacing: 12,
            children: List.generate(_vectors.length, (index) {
              final mode = _vectors.keys.elementAt(index);
              final isSelected = _selectedTheme == mode;
              final name = switch (mode) {
                ThemeMode.light => 'Och rangli',
                ThemeMode.dark => 'To‘q rangli',
                ThemeMode.system => 'Tizimli',
              };

              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTheme = mode),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: .circular(12),
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
                      SizedBox(height: 8),
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
              );
            }),
          ),
        ),
        SafeArea(
          minimum: .symmetric(horizontal: 16, vertical: 12),
          child: AppButton(
            onTap: context.pop,
            label: "Qo‘llash",
          ),
        ),
      ],
    );
  }
}
