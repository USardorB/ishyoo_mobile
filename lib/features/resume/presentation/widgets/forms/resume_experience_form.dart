import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ResumeExperienceForm extends HookWidget {
  final VoidCallback? onMonthTapped;

  const ResumeExperienceForm({super.key, this.onMonthTapped});

  @override
  Widget build(BuildContext context) {
    final currentlyWorking = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildTextField(context, "Kompaniya nomi", "Uzum bank"),
        const SizedBox(height: 24),
        _buildTextField(context, "Lavozim yoki kasb", "UX/UI Dizayner"),
        const SizedBox(height: 24),
        _buildActionField(context, "Shahar", "Toshkent"),
        const SizedBox(height: 24),
        _buildTextField(
          context,
          "Vazifalar va yutuqlar",
          "Raqamli mahsulotlarning UX/UI dizaynini ishlab chiqish; oziq-ovqat yetkazib berish mobil ilovasi, taksi ilovasi va onlayn kinoteatr dizaynini ishlab chiqish",
          maxLines: 4,
        ),
        const SizedBox(height: 24),
        Text(
          "Ish boshlangan sana",
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: _buildActionField(context, "", "May", hasLabel: false, onTap: onMonthTapped),
            ),
            Expanded(
              child: _buildTextField(context, "", "2025", hasLabel: false),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          "Ishning tugash sanasi",
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: _buildActionField(
                context,
                "",
                currentlyWorking.value ? "Oy" : "May",
                hasLabel: false,
                isPlaceholder: currentlyWorking.value,
                onTap: currentlyWorking.value ? null : onMonthTapped,
              ),
            ),
            Expanded(
              child: _buildTextField(
                context,
                "",
                currentlyWorking.value ? "Yill" : "2025",
                hasLabel: false,
                isPlaceholder: currentlyWorking.value,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () {
            currentlyWorking.value = !currentlyWorking.value;
          },
          child: Row(
            children: [
              Text(
                "Hozir ishlayapman",
                style: context.textThemes.b2,
              ),
              const Spacer(),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: currentlyWorking.value ? context.colors.brandProgress : Colors.transparent,
                  border: Border.all(
                    color: currentlyWorking.value ? context.colors.brandProgress : context.colors.textSecondary,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: currentlyWorking.value
                    ? const Icon(Icons.check, color: Colors.black, size: 16)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, {int maxLines = 1, bool hasLabel = true, bool isPlaceholder = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) ...[
          Text(
            label,
            style: context.textThemes.c2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: isPlaceholder ? null : TextEditingController(text: hint),
            style: context.textThemes.b2,
            maxLines: maxLines,
            enabled: !isPlaceholder,
            decoration: InputDecoration(
              hintText: isPlaceholder ? hint : null,
              hintStyle: context.textThemes.b2.copyWith(color: context.colors.textSecondary),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionField(BuildContext context, String label, String value, {bool hasLabel = true, bool isPlaceholder = false, VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) ...[
          Text(
            label,
            style: context.textThemes.c2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: onTap ?? () {},
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
                    style: context.textThemes.b2.copyWith(
                      color: isPlaceholder ? context.colors.textSecondary : context.colors.textPrimary,
                    ),
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
