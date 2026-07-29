import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

import '../../../resume/data/models/resume.dart';
import '../../../resume/domain/usecases/get_candidate_resumes_usecase.dart';

class ApplyVacancySheet extends StatefulWidget {
  final void Function(String resumeId, String? coverLetter) onApply;

  const ApplyVacancySheet({super.key, required this.onApply});

  @override
  State<ApplyVacancySheet> createState() => _ApplyVacancySheetState();
}

class _ApplyVacancySheetState extends State<ApplyVacancySheet> {
  final _coverLetterController = TextEditingController();
  List<Resume>? _resumes;
  String? _error;
  bool _isLoading = true;
  Resume? _selectedResume;

  @override
  void initState() {
    super.initState();
    _fetchResumes();
  }

  @override
  void dispose() {
    _coverLetterController.dispose();
    super.dispose();
  }

  Future<void> _fetchResumes() async {
    final useCase = sl<GetCandidateResumesUseCase>();
    final result = await useCase(NoParam());

    if (mounted) {
      result.fold(
        (failure) {
          setState(() {
            _error = failure.message;
            _isLoading = false;
          });
        },
        (resumes) {
          setState(() {
            _resumes = resumes;
            _isLoading = false;
            if (resumes.isNotEmpty) {
              _selectedResume = resumes.firstWhere(
                (r) => r.isPrimary == true,
                orElse: () => resumes.first,
              );
            }
          });
        },
      );
    }
  }

  void _onApply() {
    if (_selectedResume == null) return;
    widget.onApply(_selectedResume!.id, _coverLetterController.text);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom:
            MediaQuery.viewInsetsOf(context).bottom +
            MediaQuery.paddingOf(context).bottom +
            12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'opportunities.apply_button',
                style: context.textThemes.h5,
              ).tr(),
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                onPressed: context.pop,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_error != null)
            Text('Xatolik: $_error', style: const TextStyle(color: Colors.red))
          else if (_resumes == null || _resumes!.isEmpty)
            const Text("profile.no_resumes").tr()
          else ...[
            Text('resume.create_resume', style: context.textThemes.s2).tr(),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: context.colors.lineSecondary),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Resume>(
                  value: _selectedResume,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: context.colors.textSecondary,
                  ),
                  items: _resumes!.map((resume) {
                    return DropdownMenuItem<Resume>(
                      value: resume,
                      child: Text(
                        resume.specialization ?? '',
                        style: context.textThemes.b2,
                      ),
                    );
                  }).toList(),
                  onChanged: (Resume? value) {
                    setState(() {
                      _selectedResume = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('messaging.type_message', style: context.textThemes.s2).tr(),
            const SizedBox(height: 8),
            AppInputField(
              controller: _coverLetterController,
              hintText: "...",
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            AppButton(
              onTap: _onApply,
              isLoading: _selectedResume == null,
              label: "opportunities.apply_button".tr(),
            ),
          ],
        ],
      ),
    );
  }
}
