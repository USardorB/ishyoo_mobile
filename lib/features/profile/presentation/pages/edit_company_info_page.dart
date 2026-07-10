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
        title: Text('Tahrirlash'),
        actions: [
          TextButton(
            onPressed: context.pop,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16),
              visualDensity: .compact,
            ),
            child: Text('Saqlash'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: .all(16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: .stretch,
          children: [
            Align(
              child: Badge(
                backgroundColor: context.colors.bgSecondary,
                alignment: Alignment(.6, .6),
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

            AppInputField(
              label: "KOMPANIYA NOMI",

              controller: TextEditingController(text: "Uzum Bank"),
            ),
            AppInputField(
              label: "Soha",
              controller: TextEditingController(text: "Uzum Bank"),
            ),
            AppInputField(
              label: "Manzil",
              controller: TextEditingController(text: "Toshkent, O'zbekiston"),
            ),
            AppInputField(
              label: "Web-sayt",
              controller: TextEditingController(text: "https://uzumbank.uz"),
            ),
            AppInputField(
              label: "Telefon",
              controller: TextEditingController(text: "+998781110000"),
            ),
            AppInputField(
              label: "Companya haqida",
              minLines: 3,
              maxLines: 5,
              controller: TextEditingController(
                text:
                    "Uzum Bank — O'zbekistondagi yetakchi raqamli bank. Biz innovatsion moliyaviy mahsulotlar yaratamiz.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
