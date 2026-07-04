import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

enum JobType {
  fullTime,
  partTime,
  freelance,
  contract,
  internship;

  String get title => switch (this) {
    JobType.fullTime => 'To‘liq ish kuni',
    JobType.partTime => 'To‘liqsiz ish kuni',
    JobType.freelance => 'Frilans',
    JobType.contract => 'Shartnoma',
    JobType.internship => 'Stajirovka',
  };
}

enum ExperienceLevel {
  inexperienced,
  oneToThree,
  threeToSix,
  moreThanSix;

  String get title => switch (this) {
    ExperienceLevel.inexperienced => 'Tajribasiz',
    ExperienceLevel.oneToThree => '1-3 yil',
    ExperienceLevel.threeToSix => '3-6 yil',
    ExperienceLevel.moreThanSix => '6 yildan ortiq',
  };
}

class TallentFilterSheet extends StatelessWidget {
  const TallentFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 12,
      ),
      child: ChipTheme(
        data: ChipThemeData(
          color: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return context.colors.brandDefault;
            }
            return context.colors.bgSecondary;
          }),
          showCheckmark: false,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.colors.bgSecondary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: context.textThemes.b3.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 12),
            Center(
              child: Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                  color: context.colors.bgTertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildHeader(context),
            SizedBox(height: 18),
            _sectionTitle(context, 'Ish turi'),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: JobType.values.map(_wrapJobChoiceChip).toList(),
            ),
            SizedBox(height: 18),
            _sectionTitle(context, 'Ixtisoslashtirish'),
            SizedBox(height: 16),
            AppInputField(
              hintText: "Mutaxassislikni tanlang",
              readOnly: true,
              suffixIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 20),
            _sectionTitle(context, 'Tajriba darajasi'),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: ExperienceLevel.values
                  .map(_wrapExperienceChoiceChip)
                  .toList(),
            ),
            SizedBox(height: 20),
            AppButton(
              onTap: () {},
              label: "Filtrni qo‘llash",
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) => Row(
    mainAxisAlignment: .spaceBetween,
    children: [
      SizedBox(
        width: 100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            visualDensity: .compact,
            padding: EdgeInsets.zero,
            onPressed: context.pop,
            icon: Icon(Icons.close),
          ),
        ),
      ),
      Text(
        'Filtrlar',
        style: context.textThemes.h5,
        maxLines: 1,
      ),
      SizedBox(
        width: 100,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              textStyle: context.textThemes.buttonLarge,
              visualDensity: .compact,
            ),
            child: Text('Tozalash'),
          ),
        ),
      ),
    ],
  );

  Text _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.textThemes.s2,
    );
  }

  Widget _wrapJobChoiceChip(JobType jobType) {
    return FilterChip(
      selected: jobType == JobType.fullTime,
      label: Text(jobType.title),
      onSelected: (bool value) {},
    );
  }

  Widget _wrapExperienceChoiceChip(ExperienceLevel experienceLevel) {
    return FilterChip(
      selected: experienceLevel == ExperienceLevel.oneToThree,
      label: Text(experienceLevel.title),
      onSelected: (bool value) {},
    );
  }
}
