import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/profile/presentation/widgets/vacancy_listing_item.dart';

class MyVacancies extends StatelessWidget {
  const MyVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        SizedBox(height: 20),
        Text('Mening vakansiyalarim', style: context.textThemes.s2),
        SizedBox(height: 16),
        VacancyListingItem(),
        SizedBox(height: 16),
        AppButton(
          onTap: () {},
          label: "Yangi yaratish",
        ),
      ],
    );
  }
}
