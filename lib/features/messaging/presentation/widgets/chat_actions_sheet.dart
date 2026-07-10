import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

enum ChatActions {
  profile(icon: Icons.person_outline),
  mute(icon: Icons.block),
  logout(icon: Icons.logout);

  final IconData icon;

  const ChatActions({required this.icon});
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
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
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
              SizedBox(height: 16),
              ...ListTile.divideTiles(
                context: context,
                tiles: ChatActions.values.map(
                  (e) => ListTile(
                    contentPadding: .zero,
                    leading: Container(
                      padding: .all(4),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: .circular(8),
                        color: context.colors.bgSecondary,
                      ),
                      child: Icon(
                        e.icon,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    title: Text(e.name),
                    titleTextStyle: context.textThemes.buttonLarge,

                    onTap: () {},
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
