import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('Sozlamalar')),
      body: Padding(
        padding: .all(16),
        child: Column(
          children: [
            Card.filled(
              margin: .zero,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Padding(
                padding: .symmetric(horizontal: 12),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => context.router.push(EditCompanyInfoRoute()),
                      contentPadding: .zero,
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.person,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Kompaniya',
                        style: context.textThemes.buttonLarge,
                      ),
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
                          child: ConfigureNotificationPreferencesSheet(),
                        ),
                      ),
                      contentPadding: .zero,
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Bildirishnomalar',
                        style: context.textThemes.buttonLarge,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    ListTile(
                      contentPadding: .zero,
                      onTap: () => launchUrl(
                        Uri.parse("https://www.ishyoo.uz/terms-of-use"),
                        mode: LaunchMode.inAppBrowserView,
                      ),
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.description_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Ishlatish qoidasi',
                        style: context.textThemes.buttonLarge,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    ListTile(
                      contentPadding: .zero,
                      onTap: () => launchUrl(
                        Uri.parse("https://www.ishyoo.uz/help"),
                        mode: LaunchMode.inAppBrowserView,
                      ),
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.headset_mic_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Yordam markazi',
                        style: context.textThemes.buttonLarge,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Card.filled(
              margin: .zero,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Padding(
                padding: .symmetric(horizontal: 12),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: .zero,
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.language,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Ilova tili',
                        style: context.textThemes.buttonLarge,
                      ),
                      trailing: Row(
                        mainAxisSize: .min,
                        spacing: 8,
                        children: [
                          Text(
                            'O‘zbek',
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
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
                          child: ChooseLanguageSheet(),
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
                          child: ChooseThemeSheet(),
                        ),
                      ),
                      contentPadding: .zero,
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(
                          Icons.palette_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      title: Text(
                        'Dastur mavzusi',
                        style: context.textThemes.buttonLarge,
                      ),
                      trailing: Row(
                        mainAxisSize: .min,
                        spacing: 8,
                        children: [
                          Text(
                            'Tizimli',
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: context.colors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Card.filled(
              margin: .zero,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(16),
              ),
              color: context.colors.bgPrimary,
              child: Padding(
                padding: .symmetric(horizontal: 12),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => LogoutConfirmationDialog(),
                        );
                      },
                      iconColor: context.colors.danger,
                      textColor: context.colors.danger,
                      contentPadding: .zero,
                      leading: Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: .circular(8),
                        ),
                        child: Icon(Icons.logout),
                      ),
                      title: Text(
                        'Akkauntdan chiqish',
                        style: context.textThemes.buttonLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Text(
                  "Ilova haqida",
                  style: context.textThemes.s2,
                ),
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
