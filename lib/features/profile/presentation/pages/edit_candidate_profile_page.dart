import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

@RoutePage()
class EditCandidateProfilePage extends HookWidget {
  const EditCandidateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("Tahrirlash"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: Text(
              "Saqlash",
              style: context.textThemes.b2.copyWith(
                color: context.colors.brandProgress,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: context.colors.bgSecondary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "AK",
                      style: context.textThemes.h4.copyWith(
                        color: context.colors.brandProgress,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.colors.bgTertiary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: AppInputField(
                    label: "Ism",
                    controller: TextEditingController(text: "Aziz"),
                  ),
                ),
                Expanded(
                  child: AppInputField(
                    label: "Familiya",
                    controller: TextEditingController(text: "Karimov"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
            AppInputField(
              label: "Shahar",
              controller: TextEditingController(text: "Toshkent"),
              readOnly: true,
              onTap: () {},
              suffixIcon: Icon(Icons.chevron_right, color: context.colors.textSecondary, size: 20),
            ),
            const SizedBox(height: 24),
            AppInputField(
              label: "Tug'ilgan sana",
              controller: TextEditingController(text: "12.05.1996"),
              readOnly: true,
              onTap: () {},
              suffixIcon: Icon(Icons.chevron_right, color: context.colors.textSecondary, size: 20),
            ),
            const SizedBox(height: 24),
            AppInputField(
              label: "O'zim haqimda",
              controller: TextEditingController(text: "3 yillik tajribaga ega UX/UI dizayner. Mobil ilovalar va banking sohasida ishlayman. Foydalanuvchi tajribasi va dizayn tizimlariga ishtiyoqim katta."),
              maxLines: 4,
              minLines: 4,
            ),
          ],
        ),
      ),
    );
  }


}
