import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/presentation/widgets/apply_to_vacancy_sheet.dart';
import 'package:mobile/features/opportunities/presentation/widgets/vacancy_map_placeholder.dart';

@RoutePage()
class VacancyDetailsPage extends StatelessWidget {
  const VacancyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            .copyWith(
              bottom:
                  MediaQuery.paddingOf(context).bottom +
                  100, // Space for bottom button
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: context.colors.bgSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'U',
                      style: context.textThemes.h3.copyWith(
                        color: context.colors.brandDefault,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Uzum Bank",
                      style: context.textThemes.s1,
                    ),
                    Text(
                      "Tashkilot",
                      style: context.textThemes.b1.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "UX/UI Dizayner",
              style: context.textThemes.h5,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 8,
              children: [
                _buildBadge(context, "Toshkent"),
                _buildBadge(context, "To'liq stavka"),
                _buildBadge(context, "Tajriba 1-3 yil"),
              ],
            ),
            const SizedBox(height: 14),
            Divider(
              color: context.colors.lineSecondary,
              height: 1,
              thickness: .5,
            ),
            const SizedBox(height: 16),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: .stretch,
                spacing: 8,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.brandProgress,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            size: 20,
                            color: context.colors.brandDefault,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "95 kishi allaqachon javob berdi",
                              style: context.textThemes.b2.copyWith(
                                color: context.colors.brandDefault,
                              ),
                              maxLines: 2,
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.brandProgress,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            size: 20,
                            color: context.colors.brandDefault,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "2 kishi tomosha qilmoqda",
                              style: context.textThemes.b2.copyWith(
                                color: context.colors.brandDefault,
                              ),
                              maxLines: 2,
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Vakansiya haqida",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 12),
            Text(
              "Bizning jamoamizga UX/UI dizayner kerak. Sizning vazifangiz – bank ilovasi va veb-saytining interfeysini yaratish, foydalanuvchi tajribasini yaxshilash va dizayn tizimini rivojlantirish.",
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Vazifalar",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 12),
            _buildBulletPoint(
              context,
              "Mobil ilova va veb-sayt uchun interfeys yaratish",
            ),
            _buildBulletPoint(
              context,
              "Foydalanuvchilar bilan tadqiqotlar o'tkazish",
            ),
            _buildBulletPoint(
              context,
              "Dizayn tizimini rivojlantirish va qo'llab-quvvatlash",
            ),
            _buildBulletPoint(
              context,
              "Mahsulot va muhandislik jamoalari bilan ishlash",
            ),

            const SizedBox(height: 24),
            Text(
              "Talablar",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 12),
            _buildBulletPoint(context, "2+ yil UX/UI dizayn tajribasi"),
            _buildBulletPoint(context, "Figma'da yuqori darajadagi mahorat"),
            _buildBulletPoint(
              context,
              "Dizayn tizimlari bilan ishlash tajribasi",
            ),
            _buildBulletPoint(
              context,
              "Ingliz tili – B2 darajasidan past emas",
            ),

            const SizedBox(height: 24),
            Text(
              "Ключевые навыки",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSkillChip(context, "Figma"),
                _buildSkillChip(context, "Adobe Photoshop"),
                _buildSkillChip(context, "UI"),
                _buildSkillChip(context, "UX"),
                _buildSkillChip(context, "Ingliz tili – B2 – O'rta-yuqori"),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              "Xaritada",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 12),
            const VacancyMapPlaceholder(),
          ],
        ),
      ),
      bottomSheet: Container(
        color: context.colors.bgPrimary,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 12,
        ),
        child: AppButton(
          onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => const ApplyToVacancySheet(),
          ),
          label: "Javob qaytarish",
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context, String text) {
    return Container(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.brandDefault,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String text) {
    return Container(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
