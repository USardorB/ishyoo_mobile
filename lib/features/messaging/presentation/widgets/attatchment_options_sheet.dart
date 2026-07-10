import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

enum AttatchmentOptionsSheetType {
  file(icon: Icons.file_present_outlined),
  gallery(icon: Icons.photo_outlined),
  camera(icon: Icons.camera_alt_outlined);

  final IconData icon;

  const AttatchmentOptionsSheetType({required this.icon});
}

class AttatchmentOptionsSheet extends StatelessWidget {
  const AttatchmentOptionsSheet({
    super.key,
  });

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
                tiles: AttatchmentOptionsSheetType.values.map(
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
