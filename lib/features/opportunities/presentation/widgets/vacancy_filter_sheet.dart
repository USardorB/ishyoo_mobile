import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
    JobType.fullTime => 'opportunities.employment_type'.tr(),
    JobType.partTime => 'opportunities.employment_type'.tr(),
    JobType.freelance => 'Frilans',
    JobType.contract => 'Shartnoma',
    JobType.internship => 'Stajirovka',
  };

  String get serverValue => switch (this) {
    JobType.fullTime => 'full_time',
    JobType.partTime => 'part_time',
    JobType.freelance => 'freelance',
    JobType.contract => 'contract',
    JobType.internship => 'internship',
  };
}

enum ExperienceLevel {
  inexperienced,
  oneToThree,
  threeToSix,
  moreThanSix;

  String get title => switch (this) {
    ExperienceLevel.inexperienced => 'applicants.unsuitable'.tr(),
    ExperienceLevel.oneToThree => '1-3 yil',
    ExperienceLevel.threeToSix => '3-6 yil',
    ExperienceLevel.moreThanSix => '6 yildan ortiq',
  };

  String get serverValue => switch (this) {
    ExperienceLevel.inexperienced => 'inexperienced',
    ExperienceLevel.oneToThree => 'one_to_three',
    ExperienceLevel.threeToSix => 'three_to_six',
    ExperienceLevel.moreThanSix => 'more_than_six',
  };
}

class VacancyFilterSheet extends StatefulWidget {
  final String? initialJobType;
  final String? initialExperienceLevel;
  final String? initialSpecialization;
  final void Function(
    String? jobType,
    String? experienceLevel,
    String? specialization,
  )? onApply;

  const VacancyFilterSheet({
    super.key,
    this.initialJobType,
    this.initialExperienceLevel,
    this.initialSpecialization,
    this.onApply,
  });

  @override
  State<VacancyFilterSheet> createState() => _VacancyFilterSheetState();
}

class _VacancyFilterSheetState extends State<VacancyFilterSheet> {
  JobType? _selectedJobType;
  ExperienceLevel? _selectedExperienceLevel;
  late final TextEditingController _specializationController;

  @override
  void initState() {
    super.initState();
    _selectedJobType = JobType.values.where((e) => e.serverValue == widget.initialJobType).firstOrNull;
    _selectedExperienceLevel = ExperienceLevel.values.where((e) => e.serverValue == widget.initialExperienceLevel).firstOrNull;
    _specializationController = TextEditingController(text: widget.initialSpecialization);
  }

  @override
  void dispose() {
    _specializationController.dispose();
    super.dispose();
  }

  void _clearFilters() {
    setState(() {
      _selectedJobType = null;
      _selectedExperienceLevel = null;
      _specializationController.clear();
    });
  }

  void _applyFilters() {
    if (widget.onApply != null) {
      final spec = _specializationController.text.trim();
      widget.onApply!(
        _selectedJobType?.serverValue,
        _selectedExperienceLevel?.serverValue,
        spec.isEmpty ? null : spec,
      );
    }
    context.pop();
  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
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
            const SizedBox(height: 16),
            _buildHeader(context),
            const SizedBox(height: 18),
            _sectionTitle(context, 'opportunities.employment_type'.tr()),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: JobType.values.map(_wrapJobChoiceChip).toList(),
            ),
            const SizedBox(height: 18),
            _sectionTitle(context, 'talents.search_placeholder'.tr()),
            const SizedBox(height: 16),
            AppInputField(
              controller: _specializationController,
              hintText: "shared.search".tr(),
            ),
            const SizedBox(height: 20),
            _sectionTitle(context, 'profile.experience'.tr()),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: ExperienceLevel.values
                  .map(_wrapExperienceChoiceChip)
                  .toList(),
            ),
            const SizedBox(height: 20),
            AppButton(
              onTap: _applyFilters,
              label: "shared.apply".tr(),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 100,
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            onPressed: context.pop,
            icon: const Icon(Icons.close),
          ),
        ),
      ),
      Text(
        'shared.filter',
        style: context.textThemes.h5,
        maxLines: 1,
      ).tr(),
      SizedBox(
        width: 100,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: _clearFilters,
            style: TextButton.styleFrom(
              textStyle: context.textThemes.buttonLarge,
              visualDensity: VisualDensity.compact,
            ),
            child: Text('shared.clear').tr(),
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
      selected: _selectedJobType == jobType,
      label: Text(jobType.title),
      onSelected: (bool value) {
        setState(() {
          _selectedJobType = value ? jobType : null;
        });
      },
    );
  }

  Widget _wrapExperienceChoiceChip(ExperienceLevel experienceLevel) {
    return FilterChip(
      selected: _selectedExperienceLevel == experienceLevel,
      label: Text(experienceLevel.title),
      onSelected: (bool value) {
        setState(() {
          _selectedExperienceLevel = value ? experienceLevel : null;
        });
      },
    );
  }
}
