import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/profile/presentation/widgets/about_the_company.dart';
import 'package:mobile/features/profile/presentation/widgets/field_of_activity.dart';
import 'package:mobile/features/profile/presentation/widgets/hr_profile_avatar_section.dart';
import 'package:mobile/features/profile/presentation/widgets/hr_profile_company_info.dart';
import 'package:mobile/features/profile/presentation/widgets/my_vacancies.dart';

@RoutePage()
class HRProfilePage extends StatelessWidget {
  const HRProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => context.pushRoute(SettingsRoute()),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: .all(16),
        children: [
          HrProfileAvatarSection(),
          MyVacancies(),
          AboutTheCompany(),
          HrProfileCompanyInfo(),
          FieldOfActivity(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
