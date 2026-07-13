import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_basic_info_step.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_requirements_step.dart';
import 'package:mobile/features/postings/presentation/widgets/create_vacancy_summary_step.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart'; // for JobType and ExperienceLevel

@RoutePage()
class CreateVacancyPage extends StatefulWidget {
  const CreateVacancyPage({super.key});

  @override
  State<CreateVacancyPage> createState() => _CreateVacancyPageState();
}

class _CreateVacancyPageState extends State<CreateVacancyPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  // Step 1 Controllers & State
  final _titleController = TextEditingController(text: 'UX/UI Dizayner');
  String? _selectedCategory = 'Bank · Moliya';
  final _addressController = TextEditingController(
    text: 'Toshkent, O\'zbekiston',
  );
  final _salaryFromController = TextEditingController();
  final _salaryToController = TextEditingController();
  final _phoneController = TextEditingController(text: '+998 90 123 45 67');
  JobType _selectedJobType = JobType.fullTime;

  // Step 2 Controllers & State
  final _descriptionController = TextEditingController(
    text:
        "Bizning jamoamizga UX/UI dizayner kerak. Bank ilovasi va veb-saytining interfeysini yaratish, foydalanuvchi tajribasini yaxshilash va dizayn tizimini rivojlantirish.",
  );
  final _tasksController = TextEditingController(
    text:
        "• Mobil ilova va veb-sayt uchun interfeys yaratish\n• Foydalanuvchilar bilan tadqiqotlar o'tkazish\n• Dizayn tizimini rivojlantirish va qo'llab-quvvatlash\n• Mahsulot va muhandislik jamoalari bilan ishlash",
  );
  final _requirementsController = TextEditingController(
    text:
        "• 2+ yil UX/UI dizayn tajribasi\n• Figma'da yuqori darajadagi mahorat\n• Dizayn tizimlari bilan ishlash tajribasi\n• Ingliz tili - B2 darajasidan past emas",
  );
  List<String> _selectedSkills = ['Figma', 'Prototyping'];
  ExperienceLevel _selectedExperience = ExperienceLevel.oneToThree;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yangi vakansiya'),
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
            child: PageView(
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
                  selectedCategory: _selectedCategory,
                  onCategorySelected: (val) =>
                      setState(() => _selectedCategory = val),
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
                  onEditBasicInfo: () => _goToStep(0),
                  onEditRequirements: () => _goToStep(1),
                  onPost: () => context.pop(),
                  onSaveDraft: () => context.pop(),
                ),
              ],
            ),
          ),
        ],
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
