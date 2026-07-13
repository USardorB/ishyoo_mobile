import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ResumeEducationForm extends StatelessWidget {
  final bool showSaveButton;
  final VoidCallback? onSave;

  const ResumeEducationForm({
    super.key,
    this.showSaveButton = true,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildActionField(context, "Ta'lim darajasi", "O'rta maxsus ta'lim"),
        const SizedBox(height: 24),
        _buildTextField(context, "Ta'lim muassasasi nomi", "Gurlan tumani 1-praktikum kasb hunar maktabi", maxLines: 2),
        const SizedBox(height: 24),
        _buildTextField(context, "Fakultet", "Kompyuter yo'nalishi"),
        const SizedBox(height: 24),
        _buildTextField(context, "Yunalish", "Grafik dizayner"),
        const SizedBox(height: 24),
        _buildTextField(context, "Bitirgan yili", "2025"),
        const SizedBox(height: 8),
        Text(
          "Agar hali ham o'qiyotgan bo'lsangiz, taklif etilayotgan bitiruv yilini ko'rsating",
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        if (showSaveButton) ...[
          const SizedBox(height: 32),
          AppButton(
            onTap: onSave ?? () {},
            label: "Saqlash",
            color: context.colors.brandProgress,
            foregroundColor: Colors.black,
          ),
          const SizedBox(height: 32), // Bottom padding
        ]
      ],
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: TextEditingController(text: hint),
            style: context.textThemes.b2,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionField(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: context.textThemes.b2,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.colors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
