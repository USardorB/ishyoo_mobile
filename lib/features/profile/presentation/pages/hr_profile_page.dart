import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_profile_bloc.dart';
import 'package:mobile/features/profile/presentation/widgets/about_the_company.dart';
import 'package:mobile/features/profile/presentation/widgets/field_of_activity.dart';
import 'package:mobile/features/profile/presentation/widgets/hr_profile_avatar_section.dart';
import 'package:mobile/features/profile/presentation/widgets/hr_profile_company_info.dart';
import 'package:mobile/features/profile/presentation/widgets/my_vacancies.dart';

import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

@RoutePage()
class HRProfilePage extends StatelessWidget {
  const HRProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<EmployerProfileBloc>()..add(LoadEmployerProfile()),
        ),
        BlocProvider(
          create: (_) => sl<EmployerOrganizationBloc>()..add(LoadEmployerOrganization()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () => context.pushRoute(SettingsRoute()),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: BlocBuilder<EmployerProfileBloc, EmployerProfileState>(
          builder: (context, profileState) {
            return BlocBuilder<EmployerOrganizationBloc, EmployerOrganizationState>(
              builder: (context, orgState) {
                if (profileState.isLoading || orgState.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    HrProfileAvatarSection(
                      profile: profileState.profile,
                      organization: orgState.organization,
                    ),
                    MyVacancies(),
                    AboutTheCompany(organization: orgState.organization),
                    HrProfileCompanyInfo(organization: orgState.organization),
                    FieldOfActivity(organization: orgState.organization),
                    const SizedBox(height: 100),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
