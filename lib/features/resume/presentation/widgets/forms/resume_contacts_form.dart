import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';
import 'package:mobile/features/resume/presentation/widgets/specializations_sheet.dart';

class ResumeContactsForm extends HookWidget {
  const ResumeContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeFormBloc>();
    final formData = bloc.state.formData;

    final emailController = useTextEditingController(text: formData['email']?.toString() ?? '');
    final phoneController = useTextEditingController(text: formData['phone']?.toString() ?? '');
    final specializationController = useTextEditingController(text: formData['specialization']?.toString() ?? '');
    final salaryController = useTextEditingController(text: formData['expected_salary']?.toString() ?? '');

    void updateData() {
      final salary = int.tryParse(salaryController.text);
      bloc.add(UpdateFormData({
        'email': emailController.text,
        'phone': phoneController.text,
        'specialization': specializationController.text,
        if (salary != null) 'expected_salary': salary,
      }));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        AppInputField(
          label: "Mutaxassislik",
          controller: specializationController,
          readOnly: true,
          onTap: () async {
            final spec = await showModalBottomSheet<String>(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => const SpecializationsSheet(),
            );
            if (spec != null) {
              specializationController.text = spec;
              updateData();
            }
          },
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "Kutilayotgan maosh (so'm)",
          controller: salaryController,
          keyboardType: TextInputType.number,
          onChanged: (_) => updateData(),
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "Email",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => updateData(),
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "Telefon",
          controller: phoneController,
          keyboardType: TextInputType.phone,
          onChanged: (_) => updateData(),
        ),
      ],
    );
  }
}
