import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

enum ChatActions {
  profile(icon: Icons.person_outline, labelKey: 'nav.profile'),
  logout(icon: Icons.logout, labelKey: 'messaging.delete_chat');

  final IconData icon;
  final String labelKey;

  const ChatActions({required this.icon, required this.labelKey});

  String get label => labelKey.tr();
}

class ChatActionsSheet extends StatelessWidget {
  const ChatActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: _buildDividerThemeData(context),
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: context.colors.bgTertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ...ListTile.divideTiles(
                context: context,
                tiles: ChatActions.values.map(
                  (e) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.bgSecondary,
                      ),
                      child: Icon(
                        e.icon,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(e.label),
                    titleTextStyle: context.textThemes.buttonLarge,
                    onTap: () {
                      Navigator.pop(context, e);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DividerThemeData _buildDividerThemeData(BuildContext context) {
    return DividerThemeData(
      thickness: .5,
      color: context.colors.lineSecondary,
    );
  }
}
