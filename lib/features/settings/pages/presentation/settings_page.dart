import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/enums/app_languages.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/settings/pages/widgets/choose_language_sheet.dart';
import 'package:mobile/features/settings/pages/widgets/choose_theme_sheet.dart';
import 'package:mobile/features/settings/pages/widgets/configure_notification_preferences_sheet.dart';
import 'package:mobile/features/settings/pages/widgets/logout_confirmation_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = AppLanguages.fromLocale(context.locale);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title', style: context.textThemes.h5).tr(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card.filled(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => context.router.push(const EditCompanyInfoRoute()),
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.person,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(
                      'profile.company_info',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.textSecondary,
                    ),
                  ),
                  ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => DividerTheme(
                        data: DividerThemeData(
                          thickness: .5,
                          color: context.colors.bgSecondary,
                        ),
                        child: const ConfigureNotificationPreferencesSheet(),
                      ),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(
                      'settings.notifications',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.textSecondary,
                    ),
                  ),
                  ListTile(
                    onTap: () => launchUrl(
                      Uri.parse("https://www.ishyoo.uz/terms-of-use"),
                      mode: LaunchMode.inAppBrowserView,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.description_outlined,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(
                      'settings.terms_of_use',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Card.filled(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.language,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(
                      'settings.language',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentLang.title,
                          style: context.textThemes.buttonMedium.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: context.colors.textSecondary,
                        ),
                      ],
                    ),
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => DividerTheme(
                        data: DividerThemeData(
                          thickness: .5,
                          color: context.colors.bgSecondary,
                        ),
                        child: const ChooseLanguageSheet(),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => DividerTheme(
                        data: DividerThemeData(
                          thickness: .5,
                          color: context.colors.bgSecondary,
                        ),
                        child: const ChooseThemeSheet(),
                      ),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.palette_outlined,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(
                      'settings.theme',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Card.filled(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const LogoutConfirmationDialog(),
                      );
                    },
                    iconColor: context.colors.danger,
                    textColor: context.colors.danger,
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.logout),
                    ),
                    title: Text(
                      'settings.logout',
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "settings.about_app",
                  style: context.textThemes.s2,
                ).tr(),
                const SizedBox(height: 8),
                Text(
                  "Versiya 1.2.14",
                  style: context.textThemes.b2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
