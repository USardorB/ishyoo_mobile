import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

@Deprecated(
  'This is dublicated, will be removed, the dublicate is at the hr_home_page',
)
class VacancyListingItem extends StatelessWidget {
  const VacancyListingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: .circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 12,
            children: [
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 6,
                  children: [
                    _buildPill(context.colors.bgSecondary, 'Toshkent'),
                    _buildPill(
                      context.colors.bgSecondary,
                      'To\'liq stavka',
                    ),
                    _buildPill(
                      context.colors.bgSecondary,
                      'Tajriba 1-3 yil',
                    ),
                  ],
                ),
              ),
              Flexible(
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: .zero,
                    visualDensity: .compact,
                  ),
                  onPressed: () {
                    // TODO: Replace with actual vacancy data when available.
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (_) => PostingActionsSheet(vacancy: vacancy),
                    // );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Tez orada qo'shiladi")),
                    );
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Senior UX/UI Dizayner",
            style: context.textThemes.s1,
          ),
          Divider(
            height: 25,
            thickness: .5,
            color: context.colors.lineSecondary,
          ),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "10–15 mln so'm",
                style: context.textThemes.s2.copyWith(
                  color: context.colors.brandDefault,
                ),
              ),
              Row(
                spacing: 6,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: context.colors.textSecondary,
                  ),
                  Text(
                    "Mar 31,2024",
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: .symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: .circular(16),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: context.colors.textSecondary,
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '247',
                            style: context.textThemes.buttonGiant,
                          ),
                          Text(
                            "Ko'rishlar",
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: .5,
                    color: context.colors.lineSecondary,
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Icon(
                        Icons.people_outlined,
                        color: context.colors.brandDefault,
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        spacing: 4,
                        children: [
                          Text(
                            '12 yangi',
                            style: context.textThemes.buttonGiant.copyWith(
                              color: context.colors.brandDefault,
                            ),
                          ),
                          Text(
                            "Ko'rishlar",
                            style: context.textThemes.buttonMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
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
      padding: .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: .circular(6),
      ),
      child: Text(text),
    );
  }
}
