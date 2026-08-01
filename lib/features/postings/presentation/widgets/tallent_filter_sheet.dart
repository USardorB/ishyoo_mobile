import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/category_selection_sheet.dart';

class TallentFilterSheet extends StatefulWidget {
  final void Function(
    String? jobType,
    String? experienceLevel,
    String? specialization,
  )?
  onApply;

  final String? initialJobType;
  final String? initialExperienceLevel;
  final String? initialSpecialization;

  const TallentFilterSheet({
    super.key,
    this.onApply,
    this.initialJobType,
    this.initialExperienceLevel,
    this.initialSpecialization,
  });

  @override
  State<TallentFilterSheet> createState() => _TallentFilterSheetState();
}

class _TallentFilterSheetState extends State<TallentFilterSheet> {
  EmploymentType? _selectedJobType;
  AppExperienceLevel? _selectedExperienceLevel;
  String? _specialization;

  @override
  void initState() {
    super.initState();
    if (widget.initialJobType != null) {
      _selectedJobType = EmploymentType.values.cast<EmploymentType?>().firstWhere(
        (e) => e?.serverValue == widget.initialJobType, orElse: () => null);
    }
    if (widget.initialExperienceLevel != null) {
      _selectedExperienceLevel = AppExperienceLevel.values.cast<AppExperienceLevel?>().firstWhere(
        (e) => e?.serverValue == widget.initialExperienceLevel, orElse: () => null);
    }
    _specialization = widget.initialSpecialization;
  }

  void _clearFilters() {
    setState(() {
      _selectedJobType = null;
      _selectedExperienceLevel = null;
      _specialization = null;
    });
  }

  void _applyFilters() {
    if (widget.onApply != null) {
      widget.onApply!(
        _selectedJobType?.serverValue,
        _selectedExperienceLevel?.serverValue,
        _specialization,
      );
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
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
              children: EmploymentType.values.map(_wrapJobChoiceChip).toList(),
            ),
            const SizedBox(height: 18),
            _sectionTitle(context, 'talents.search_placeholder'.tr()),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) => sl<PostingsBloc>()..add(LoadPostings()),
              child: BlocBuilder<PostingsBloc, PostingsState>(
                builder: (context, state) {
                  return AppInputField(
                    hintText: _specialization ?? "shared.search".tr(),
                    readOnly: true,
                    suffixIcon: Icon(
                      Icons.chevron_right,
                      color: context.colors.textSecondary,
                    ),
                    onTap: () async {
                      final result = await showModalBottomSheet<String>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: context.colors.bgPrimary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24)),
                        ),
                        builder: (context) => CategorySelectionSheet(
                          specializations: state.specializations ?? [],
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          _specialization = result;
                        });
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _sectionTitle(context, 'profile.experience'.tr()),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: AppExperienceLevel.values
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
            child: const Text('shared.clear').tr(),
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

  Widget _wrapJobChoiceChip(EmploymentType jobType) {
    return FilterChip(
      selected: _selectedJobType == jobType,
      label: Text(jobType.localizedLabel),
      onSelected: (bool value) {
        setState(() {
          _selectedJobType = value ? jobType : null;
        });
      },
    );
  }

  Widget _wrapExperienceChoiceChip(AppExperienceLevel experienceLevel) {
    return FilterChip(
      selected: _selectedExperienceLevel == experienceLevel,
      label: Text(experienceLevel.localizedLabel),
      onSelected: (bool value) {
        setState(() {
          _selectedExperienceLevel = value ? experienceLevel : null;
        });
      },
    );
  }
}
