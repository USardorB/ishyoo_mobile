import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class SkillsSelectionSheet extends StatefulWidget {
  final List<String> initialSkills;

  const SkillsSelectionSheet({super.key, required this.initialSkills});

  @override
  State<SkillsSelectionSheet> createState() => _SkillsSelectionSheetState();
}

class _SkillsSelectionSheetState extends State<SkillsSelectionSheet> {
  final List<String> _availableSkills = [
    'Figma',
    'Prototyping',
    'Wireframing',
    'UI Design',
    'UX Research',
    'Adobe XD',
    'Sketch',
    'InVision',
  ];
  late List<String> _selectedSkills;

  @override
  void initState() {
    super.initState();
    _selectedSkills = List.from(widget.initialSkills);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 12,
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
          AppInputField(
            hintText: "shared.search".tr(),
            prefixIcon: Icon(Icons.search, color: context.colors.textSecondary),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _availableSkills.map((skill) {
              final isSelected = _selectedSkills.contains(skill);
              return FilterChip(
                selected: isSelected,
                label: Text(skill),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedSkills.add(skill);
                    } else {
                      _selectedSkills.remove(skill);
                    }
                  });
                },
                showCheckmark: false,
                backgroundColor: context.colors.bgSecondary,
                selectedColor: context.colors.brandDefault,
                side: BorderSide(
                  color: isSelected
                      ? context.colors.brandDefault
                      : context.colors.bgSecondary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: context.textThemes.b3.copyWith(
                  color: isSelected
                      ? context.colors.midnightImmutable
                      : context.colors.textSecondary,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(width: 48),
      Expanded(
        child: Text(
          'profile.languages',
          style: context.textThemes.h5,
          textAlign: TextAlign.center,
          maxLines: 1,
        ).tr(),
      ),
      SizedBox(
        width: 48,
        child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            onPressed: () => context.pop(_selectedSkills),
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    ],
  );
}
