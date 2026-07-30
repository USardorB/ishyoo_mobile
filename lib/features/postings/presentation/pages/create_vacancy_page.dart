import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_basic_info_step.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_requirements_step.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_summary_step.dart';

@RoutePage()
class CreateVacancyPage extends StatefulWidget {
  final Vacancy? vacancyToEdit;

  const CreateVacancyPage({super.key, this.vacancyToEdit});

  @override
  State<CreateVacancyPage> createState() => _CreateVacancyPageState();
}

class _CreateVacancyPageState extends State<CreateVacancyPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  bool get _isEditMode => widget.vacancyToEdit != null;

  final _titleController = TextEditingController();
  String? _selectedSpecialization;
  final _addressController = TextEditingController();
  final _salaryFromController = TextEditingController();
  final _salaryToController = TextEditingController();
  final _phoneController = TextEditingController();
  EmploymentType _selectedJobType = EmploymentType.fullTime;

  final _descriptionController = TextEditingController();
  final _tasksController = TextEditingController();
  final _requirementsController = TextEditingController();
  List<String> _selectedSkills = [];
  AppExperienceLevel _selectedExperience = AppExperienceLevel.oneToThree;

  @override
  void initState() {
    super.initState();
    if (widget.vacancyToEdit != null) {
      final v = widget.vacancyToEdit!;
      _titleController.text = v.jobTitle;
      _selectedSpecialization = v.specialization;
      _addressController.text = v.location ?? '';
      _salaryFromController.text = v.salaryFrom?.toString() ?? '';
      _salaryToController.text = v.salaryTo?.toString() ?? '';
      _phoneController.text = v.contact?.phoneNumber ?? '';
      _selectedJobType = EmploymentType.fromServer(v.jobType) ?? EmploymentType.fullTime;
      _descriptionController.text = v.description ?? '';
      _tasksController.text = v.responsibilities ?? '';
      _requirementsController.text = v.requirements ?? '';
      _selectedSkills = v.keySkills ?? [];
      _selectedExperience = AppExperienceLevel.fromServer(v.experienceLevel) ?? AppExperienceLevel.oneToThree;
    }
  }

  void _nextStep() {
    if (_currentStep < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToStep(int step) {
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostingsBloc>()..add(LoadPostings()),
      child: BlocListener<PostingsBloc, PostingsState>(
        listener: (context, state) {
          if (state.isCreateSuccess) {
            context.pop(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(_isEditMode ? 'opportunities.edit_vacancy' : 'opportunities.create_vacancy').tr(),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (_currentStep > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  context.pop();
                }
              },
            ),
          ),
          body: Column(
            children: [
              _buildStepIndicator(),
              Expanded(
                child: BlocBuilder<PostingsBloc, PostingsState>(
                  builder: (context, state) {
                    return PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _currentStep = index;
                        });
                      },
                      children: [
                        CreateVacancyBasicInfoStep(
                          titleController: _titleController,
                          selectedSpecialization: _selectedSpecialization,
                          specializations: state.specializations ?? [],
                          onSpecializationSelected: (val) =>
                              setState(() => _selectedSpecialization = val),
                          addressController: _addressController,
                          salaryFromController: _salaryFromController,
                          salaryToController: _salaryToController,
                          phoneController: _phoneController,
                          selectedJobType: _selectedJobType,
                          onJobTypeSelected: (val) =>
                              setState(() => _selectedJobType = val),
                          onNext: _nextStep,
                        ),
                        CreateVacancyRequirementsStep(
                          descriptionController: _descriptionController,
                          tasksController: _tasksController,
                          requirementsController: _requirementsController,
                          selectedSkills: _selectedSkills,
                          onSkillsChanged: (val) =>
                              setState(() => _selectedSkills = val),
                          selectedExperience: _selectedExperience,
                          onExperienceSelected: (val) =>
                              setState(() => _selectedExperience = val),
                          onNext: _nextStep,
                        ),
                        CreateVacancySummaryStep(
                          title: _titleController.text,
                          jobType: _selectedJobType,
                          experience: _selectedExperience,
                          description: _descriptionController.text,
                          salaryFrom: _salaryFromController.text,
                          salaryTo: _salaryToController.text,
                          location: _addressController.text,
                          onEditBasicInfo: () => _goToStep(0),
                          onEditRequirements: () => _goToStep(1),
                          onPost: () {
                            final body = {
                              'job_title': _titleController.text,
                              'specialization': _selectedSpecialization,
                              'location': _addressController.text,
                              'salary_from': int.tryParse(
                                _salaryFromController.text,
                              ),
                              'salary_to': int.tryParse(
                                _salaryToController.text,
                              ),
                              'currency': 'uzs',
                              'contact': {
                                'phone_number': _phoneController.text,
                              },
                              'job_type': _selectedJobType.serverValue,
                              'description': _descriptionController.text,
                              'responsibilities': _tasksController.text,
                              'requirements': _requirementsController.text,
                              'key_skills': _selectedSkills,
                              'experience_level':
                                  _selectedExperience.serverValue,
                              'is_temporary': false,
                            };
                            if (_isEditMode) {
                              context.read<PostingsBloc>().add(
                                UpdatePosting(widget.vacancyToEdit!.id, body),
                              );
                            } else {
                              context.read<PostingsBloc>().add(
                                CreatePosting(body),
                              );
                            }
                          },
                          onSaveDraft: () => context.pop(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: List.generate(3, (index) {
          final isActive = index <= _currentStep;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index < 2 ? 8.0 : 0),
              height: 2,
              decoration: BoxDecoration(
                color: isActive
                    ? context.colors.brandDefault
                    : context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
