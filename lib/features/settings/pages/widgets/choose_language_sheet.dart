import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ChooseLanguageSheet extends StatelessWidget {
  const ChooseLanguageSheet({super.key});

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
                "Ilova tili",
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
              onTap: context.pop,
              leading: Icon(Icons.language),
              title: Text(
                "O'zbek",
                style: context.textThemes.b2,
              ),
              trailing: Icon(
                Icons.radio_button_unchecked,
                // color: context.colors.brandDefault,
              ),
            ),
            ListTile(
              onTap: context.pop,
              leading: Icon(Icons.language),
              title: Text(
                "Русский",
                style: context.textThemes.b2,
              ),
              trailing: Icon(
                Icons.radio_button_unchecked,
                // color: context.colors.brandDefault,
              ),
            ),
            ListTile(
              onTap: context.pop,
              leading: Icon(Icons.language),
              title: Text(
                "English",
                style: context.textThemes.b2,
              ),
              trailing: Icon(
                Icons.radio_button_checked,
                color: context.colors.brandDefault,
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
