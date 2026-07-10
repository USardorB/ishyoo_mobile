import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ConfigureNotificationPreferencesSheet extends StatelessWidget {
  const ConfigureNotificationPreferencesSheet({super.key});

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
                "Bildirishnomalar",
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
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text(
                "Push-bildirishnomalar",
                style: context.textThemes.buttonLarge,
              ),
              trailing: Switch.adaptive(
                applyCupertinoTheme: true,
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text(
                "Email xabarlar",
                style: context.textThemes.buttonLarge,
              ),
              trailing: Switch.adaptive(
                applyCupertinoTheme: true,
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text(
                "Email xabarlar",
                style: context.textThemes.buttonLarge,
              ),
              trailing: Switch.adaptive(
                applyCupertinoTheme: true,
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
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
