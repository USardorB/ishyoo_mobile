import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class ResumeContactsForm extends StatelessWidget {
  const ResumeContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        AppInputField(
          label: "Email",
          controller: TextEditingController(text: "aziz.k@gmail.com"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "Telefon",
          controller: TextEditingController(text: "+998 90 123 45 67"),
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
