import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class VacancyMapPlaceholder extends StatelessWidget {
  const VacancyMapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2B2E3D), // Dark map background color
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Custom Marker in the center
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.brandDefault,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.ishYoo,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 24,
                  color: Colors.white,
                ),
                // Offset slightly to center the bottom of the line on the "target"
                const SizedBox(height: 48),
              ],
            ),
          ),

          // Zoom Controls (Right)
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.bgPrimary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Tez orada qo'shiladi")),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 32,
                    color: context.colors.bgTertiary,
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Tez orada qo'shiladi")),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.remove, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Location Button (Bottom Left)
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: context.colors.bgPrimary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.navigation,
                    color: context.colors.brandDefault,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Локация",
                    style: context.textThemes.b2.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
