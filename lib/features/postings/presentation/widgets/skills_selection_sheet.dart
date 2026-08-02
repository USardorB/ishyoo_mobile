import 'dart:math';

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
  static const List<String> _allSkills = [
    'Flutter',
    'Dart',
    'React',
    'React Native',
    'iOS',
    'Android',
    'Node.js',
    'Python',
    'Java',
    'Kotlin',
    'Swift',
    'C++',
    'C#',
    'Go',
    'Rust',
    'PHP',
    'Ruby',
    'SQL',
    'NoSQL',
    'MongoDB',
    'PostgreSQL',
    'MySQL',
    'AWS',
    'Azure',
    'Google Cloud',
    'Docker',
    'Kubernetes',
    'CI/CD',
    'Git',
    'Firebase',
    'HTML',
    'CSS',
    'JavaScript',
    'TypeScript',
    'Vue.js',
    'Angular',
    'Svelte',
    'Next.js',
    'Nuxt.js',
    'Tailwind CSS',
    'Material UI',
    'Figma',
    'Sketch',
    'UI Design',
    'UX Design',
    'Prototyping',
    'Wireframing',
    'Adobe XD',
    'Photoshop',
    'Illustrator',
    'After Effects',
    'Premiere Pro',
    'InVision',
    'Zeplin',
    'User Research',
    'Agile',
    'Scrum',
    'Kanban',
    'Jira',
    'Trello',
    'Confluence',
    'Product Management',
    'Project Management',
    'SEO',
    'SEM',
    'Content Marketing',
    'Social Media Marketing',
    'Email Marketing',
    'Google Analytics',
    'Data Analysis',
    'Machine Learning',
    'Artificial Intelligence',
    'Deep Learning',
    'NLP',
    'Computer Vision',
    'Data Science',
    'Data Engineering',
    'Business Intelligence',
    'Tableau',
    'Power BI',
    'Excel',
    'Communication',
    'Leadership',
    'Teamwork',
    'Problem Solving',
    'Time Management',
    'Critical Thinking',
    'Adaptability',
    'Creativity',
    'Emotional Intelligence',
    'Conflict Resolution',
    'Sales',
    'B2B',
    'B2C',
    'Customer Success',
    'Customer Support',
    'Account Management',
    'CRM',
    'Salesforce',
    'HubSpot',
    'Zendesk',
    'Negotiation',
    'Public Speaking',
    'Writing',
    'Editing',
    'Translation',
    'Photography',
    'Videography',
  ];

  late List<String> _selectedSkills;
  late List<String> _randomSuggestions;
  List<String> _displayedSkills = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedSkills = List.from(widget.initialSkills);

    // Pick 10 random skills for initial suggestions
    final random = Random();
    final shuffled = List<String>.from(_allSkills)..shuffle(random);
    _randomSuggestions = shuffled.take(10).toList();

    // Always include selected skills in the suggestions initially if search is empty
    _updateDisplayedSkills();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateDisplayedSkills() {
    if (_searchQuery.isEmpty) {
      // Show selected skills + random suggestions, ensuring uniqueness
      final set = <String>{..._selectedSkills, ..._randomSuggestions};
      _displayedSkills = set.toList();
    } else {
      final queryLower = _searchQuery.toLowerCase();
      // Filter from all skills + selected skills that might be custom
      final combinedSkills = <String>{..._allSkills, ..._selectedSkills};
      _displayedSkills = combinedSkills
          .where((s) => s.toLowerCase().contains(queryLower))
          .toList();
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.trim();
      _updateDisplayedSkills();
    });
  }

  void _toggleSkill(String skill, bool selected) {
    _searchController.clear();
    _onSearchChanged("");
    setState(() {
      if (selected) {
        _selectedSkills.add(skill);
      } else {
        _selectedSkills.remove(skill);
      }
      _updateDisplayedSkills();
    });
  }

  void _addNewSkill(String skill) {
    setState(() {
      _selectedSkills.add(skill);
      _searchController.clear();
      _searchQuery = '';
      _updateDisplayedSkills();
    });
  }

  @override
  Widget build(BuildContext context) {
    final showAddOption =
        _searchQuery.isNotEmpty &&
        !_displayedSkills.any(
          (s) => s.toLowerCase() == _searchQuery.toLowerCase(),
        );

    return Material(
      color: context.colors.bgSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
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
              controller: _searchController,
              onChanged: _onSearchChanged,
              hintText: "postings.skills.searchPlaceholder".tr(),
              prefixIcon: Icon(
                Icons.search,
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedSkills.isNotEmpty) ...[
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxHeight: 180),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: _selectedSkills.map((skill) {
                      return FilterChip(
                        selected: true,
                        label: Text(skill),
                        onSelected: (_) => _toggleSkill(skill, false),
                        showCheckmark: false,
                        backgroundColor: context.colors.bgSecondary,
                        selectedColor: context.colors.brandDefault,
                        side: BorderSide(
                          color: context.colors.brandDefault,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelStyle: context.textThemes.b3.copyWith(
                          color: context.colors.midnightImmutable,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                ..._displayedSkills
                    .where((s) => !_selectedSkills.contains(s))
                    .map((skill) {
                      return FilterChip(
                        selected: false,
                        label: Text(skill),
                        onSelected: (_) => _toggleSkill(skill, true),
                        showCheckmark: false,
                        backgroundColor: context.colors.bgTertiary,
                        selectedColor: context.colors.brandDefault,
                        side: BorderSide(
                          color: context.colors.bgSecondary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelStyle: context.textThemes.b3.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      );
                    }),
                if (showAddOption)
                  ActionChip(
                    onPressed: () => _addNewSkill(_searchQuery),
                    label: Text('${"postings.skills.add".tr()} "$_searchQuery"'),
                    avatar: Icon(
                      Icons.add,
                      size: 16,
                      color: context.colors.textPrimary,
                    ),
                    backgroundColor: context.colors.bgSecondary,
                    side: BorderSide(color: context.colors.bgTertiary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelStyle: context.textThemes.b3.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(width: 48),
      Expanded(
        child: Text(
          'postings.keySkills',
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
