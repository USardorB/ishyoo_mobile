import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/painters/dashed_outline_border.dart';
import 'package:mobile/features/postings/presentation/widgets/hr_dashboard_app_bar.dart';
import 'package:mobile/features/postings/presentation/widgets/posting_actions_sheet.dart';

@RoutePage()
class HrDashboardPage extends StatelessWidget {
  const HrDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HrDashboardAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(bottom: MediaQuery.paddingOf(context).bottom),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              'Salom, Aziza!',
              style: context.textThemes.h5,
            ),
            Text(
              "Bugun 12 ta yangi javob va 47 ta ko'rish",
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 16),
            Row(
              spacing: 8,
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Material(
                    color: context.colors.bgSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          Text(
                            "KO'RISHLAR",
                            style: context.textThemes.c1.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("47", style: context.textThemes.h3),
                          SizedBox(height: 8),
                          Row(
                            spacing: 4,
                            children: [
                              Icon(Icons.trending_up, size: 12),
                              Text(
                                '+12%',
                                style: context.textThemes.c1.copyWith(
                                  color: context.colors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Text(
                  'Mening vakansiyalarim',
                  style: context.textThemes.s2,
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  label: Text("Barchasi"),
                  style: TextButton.styleFrom(
                    textStyle: context.textThemes.buttonSmall,
                    iconAlignment: .end,
                    visualDensity: .compact,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Material(
              color: context.colors.bgPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: .all(12),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    Flexible(
                      child: Row(
                        spacing: 8,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 40,
                              child: SingleChildScrollView(
                                scrollDirection: .horizontal,
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Toshkent",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "To'liq stavka",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Tajriba 1-3 yil",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => PostingActionsSheet(),
                            ),
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Senior UX/UI Dizayner",
                      style: context.textThemes.s1,
                    ),
                    Divider(
                      thickness: .5,
                      height: 25,
                      color: context.colors.textSecondary,
                    ),
                    Row(
                      children: [
                        Text(
                          "10–15 mln so'm",
                          style: context.textThemes.s2.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                        Spacer(),
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
                    Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: context.colors.bgSecondary,
                      child: SizedBox(
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: .start,
                                      mainAxisSize: .min,
                                      children: [
                                        Text(
                                          "245",
                                          style: context.textThemes.buttonGiant,
                                        ),
                                        Text(
                                          "Ko'rishlar",
                                          style: context.textThemes.buttonMedium
                                              .copyWith(
                                                color: context
                                                    .colors
                                                    .textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: .start,
                                      mainAxisSize: .min,
                                      children: [
                                        Text(
                                          "245",
                                          style: context.textThemes.buttonGiant,
                                        ),
                                        Text(
                                          "Ko'rishlar",
                                          style: context.textThemes.buttonMedium
                                              .copyWith(
                                                color: context
                                                    .colors
                                                    .textSecondary,
                                              ),
                                        ),
                                      ],
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
              ),
            ),
            SizedBox(height: 12),
            Material(
              color: context.colors.bgPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: .all(12),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  children: [
                    Flexible(
                      child: Row(
                        spacing: 8,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 40,
                              child: SingleChildScrollView(
                                scrollDirection: .horizontal,
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Toshkent",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "To'liq stavka",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                      color: context.colors.bgSecondary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Tajriba 1-3 yil",
                                          style: context.textThemes.b3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Senior UX/UI Dizayner",
                      style: context.textThemes.s1,
                    ),
                    Divider(
                      thickness: .5,
                      height: 25,
                      color: context.colors.textSecondary,
                    ),
                    Row(
                      children: [
                        Text(
                          "10–15 mln so'm",
                          style: context.textThemes.s2.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                        Spacer(),
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
                    Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: context.colors.bgSecondary,
                      child: SizedBox(
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: .start,
                                      mainAxisSize: .min,
                                      children: [
                                        Text(
                                          "245",
                                          style: context.textThemes.buttonGiant,
                                        ),
                                        Text(
                                          "Ko'rishlar",
                                          style: context.textThemes.buttonMedium
                                              .copyWith(
                                                color: context
                                                    .colors
                                                    .textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye),
                                    SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: .start,
                                      mainAxisSize: .min,
                                      children: [
                                        Text(
                                          "245",
                                          style: context.textThemes.buttonGiant,
                                        ),
                                        Text(
                                          "Ko'rishlar",
                                          style: context.textThemes.buttonMedium
                                              .copyWith(
                                                color: context
                                                    .colors
                                                    .textSecondary,
                                              ),
                                        ),
                                      ],
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
              ),
            ),
            SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () => context.pushRoute(CreateVacancyRoute()),
              icon: Icon(Icons.add),
              label: Text("Vakansiya yaratish"),
              style: FilledButton.styleFrom(
                padding: .all(14),
                shape: DashedOutlineBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: context.colors.bgTertiary),
                ),
                textStyle: context.textThemes.buttonLarge,
                foregroundColor: context.colors.brandDefault,
                backgroundColor: context.colors.bgPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
