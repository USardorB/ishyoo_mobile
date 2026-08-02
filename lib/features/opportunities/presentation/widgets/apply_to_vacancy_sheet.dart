import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ApplyToVacancySheet extends HookWidget {
  const ApplyToVacancySheet({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedResumeIndex = useState<int>(0);
    final showCoverLetter = useState<bool>(false);
    final coverLetterController = useTextEditingController();

    useListenable(coverLetterController);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "opportunities.apply_button",
            style: context.textThemes.h5,
          ).tr(),
          const SizedBox(height: 4),
          Text(
            "",
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: .5,
            height: 1,
            color: context.colors.lineSecondary,
          ),
          const SizedBox(height: 16),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _ResumeTile(
                    fileName: "CV.pdf",
                    fileDetails: "2.4 MB",
                    isSelected: selectedResumeIndex.value == 0,
                    onTap: () => selectedResumeIndex.value = 0,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: context.colors.bgTertiary,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: context.colors.brandDefault,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "opportunities.apply.selectResume",
                            style: context.textThemes.b2.copyWith(
                              color: context.colors.brandDefault,
                            ),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!showCoverLetter.value)
                    AppButton(
                      onTap: () => showCoverLetter.value = true,
                      label: "opportunities.apply.add".tr(),
                      color: context.colors.bgTertiary,
                      foregroundColor: context.colors.textPrimary,
                    )
                  else
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppInputField(
                            controller: coverLetterController,
                            maxLines: 4,
                            maxLength: 500,
                            hintText: "...",
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                          ),
                          Text(
                            "${coverLetterController.text.length} / 500",
                            style: context.textThemes.c2.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          AppButton(
            onTap: context.pop,
            label: "opportunities.apply_button".tr(),
          ),
        ],
      ),
    );
  }
}

class _ResumeTile extends StatelessWidget {
  final String fileName;
  final String fileDetails;
  final bool isSelected;
  final VoidCallback onTap;

  const _ResumeTile({
    required this.fileName,
    required this.fileDetails,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? context.colors.brandDefault
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "PDF",
                style: context.textThemes.c2.copyWith(
                  color: context.colors.brandDefault,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName,
                    style: context.textThemes.s2,
                  ),
                  Text(
                    fileDetails,
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colors.brandDefault
                      : context.colors.bgTertiary,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: context.colors.brandDefault,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
