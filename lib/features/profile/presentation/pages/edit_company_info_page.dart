import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

@RoutePage()
class EditCompanyInfoPage extends StatelessWidget {
  const EditCompanyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahrirlash'),
        actions: [
          TextButton(
            onPressed: context.maybePop,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              visualDensity: VisualDensity.compact,
            ),
            child: Text(
              'Saqlash',
              style: context.textThemes.s2.copyWith(
                color: context.colors.brandProgress,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              child: Badge(
                backgroundColor: context.colors.bgSecondary,
                alignment: const Alignment(.6, .6),
                label: Icon(
                  Icons.edit_outlined,
                  color: context.colors.textPrimary,
                ),
                child: CircleAvatar(
                  backgroundColor: context.colors.bgSecondary,
                  radius: 48,
                  child: Text(
                    "UB",
                    style: context.textThemes.h3.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AppInputField(
              label: "KOMPANIYA NOMI",
              controller: TextEditingController(text: "Uzum Bank"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "Soha",
              controller: TextEditingController(text: "Bank · Moliya"),
              readOnly: true,
              suffixIcon: Icon(
                Icons.chevron_right,
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "Manzil",
              controller: TextEditingController(text: "Toshkent, O'zbekiston"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "Wev Sayt",
              controller: TextEditingController(text: "uzumbank.uz"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "Telefon",
              controller: TextEditingController(text: "+998 90 123 45 67"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "O'zim haqimda",
              minLines: 4,
              maxLines: 6,
              controller: TextEditingController(
                text:
                    "Uzum Bank – O'zbekistondagi yetakchi raqamli bank. Biz innovatsion moliyaviy mahsulotlar yaratamiz.",
              ),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "XODIMLAR SONI",
              controller: TextEditingController(text: "2 540 ta"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "BOZORDA",
              controller: TextEditingController(text: "8 yil"),
            ),
            const SizedBox(height: 16),
            AppInputField(
              label: "TASHKIL TOPGAN YILI",
              controller: TextEditingController(text: "2017"),
            ),
            const SizedBox(height: 16),
            Text(
              "FAOLIYAT SOHASI",
              style: context.textThemes.s3.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChip(context, "Bank"),
                _buildChip(context, "Moliya"),
                _buildChip(context, "Fintech"),
                _buildChip(context, "Raqamli xizmatlar"),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: context.textThemes.b2,
      ),
    );
  }
}
