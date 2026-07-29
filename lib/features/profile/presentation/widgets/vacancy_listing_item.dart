import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';

@Deprecated(
  'This is dublicated, will be removed, the dublicate is at the hr_home_page',
)
class VacancyListingItem extends StatelessWidget {
  const VacancyListingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPill(context.colors.bgSecondary, 'Toshkent'),
                    const SizedBox(width: 6),
                    _buildPill(
                      context.colors.bgSecondary,
                      'shared.all'.tr(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: () {
                  AppNotificationOverlay.instance.show(
                    message: "shared.coming_soon".tr(),
                    type: AppNotificationType.warning,
                  );
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "opportunities.title",
            style: context.textThemes.s1,
          ).tr(),
          Divider(
            height: 25,
            thickness: .5,
            color: context.colors.lineSecondary,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "shared.negotiable",
                style: context.textThemes.s2.copyWith(
                  color: context.colors.brandDefault,
                ),
              ).tr(),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: context.colors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "2024",
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: context.colors.textSecondary,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0',
                            style: context.textThemes.buttonGiant,
                          ),
                          Text(
                            "applicants.unseen",
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: .5,
                    color: context.colors.lineSecondary,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_outlined,
                        color: context.colors.brandDefault,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0',
                            style: context.textThemes.buttonGiant.copyWith(
                              color: context.colors.brandDefault,
                            ),
                          ),
                          Text(
                            "applicants.invited",
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPill(Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text),
    );
  }
}
