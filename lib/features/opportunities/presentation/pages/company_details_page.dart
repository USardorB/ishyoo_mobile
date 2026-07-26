import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';

import '../../../../core/configs/di/configure_dependencies.dart';
import '../bloc/company_details/company_details_bloc.dart';

@RoutePage()
class CompanyDetailsPage extends StatelessWidget {
  final Organization organization;

  const CompanyDetailsPage({super.key, required this.organization});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CompanyDetailsBloc>()..add(LoadCompanyDetails(organization.id!)),
      child: _CompanyDetailsView(initialOrganization: organization),
    );
  }
}

class _CompanyDetailsView extends StatelessWidget {
  final Organization initialOrganization;

  const _CompanyDetailsView({required this.initialOrganization});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsBloc, CompanyDetailsState>(
      builder: (context, state) {
        final organization = state.organization ?? initialOrganization;
        final isLoading = state.status == CompanyDetailsStatus.loading;

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo and Name
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: context.colors.brandProgress,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child:
                                  organization.logo != null &&
                                      organization.logo!.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: organization.logo!,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          _buildFallbackLogo(context),
                                    )
                                  : _buildFallbackLogo(context),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              organization.name ?? 'Noma\'lum tashkilot',
                              style: context.textThemes.h2,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              organization.industry ?? 'Tashkilot',
                              style: context.textThemes.b2.copyWith(
                                color: context.colors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Active Vacancies Banner
                      if (organization.count != null &&
                          organization.count!['vacancy'] != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.brandDefault,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Faol vakansiyalar",
                                style: context.textThemes.s2.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                organization.count!['vacancy'].toString(),
                                style: context.textThemes.s2.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Description
                      if (organization.description != null &&
                          organization.description!.isNotEmpty) ...[
                        Text(
                          "Kompaniya haqida",
                          style: context.textThemes.h3,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          organization.description!,
                          style: context.textThemes.b2.copyWith(
                            color: context.colors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ],
                  ),
                ),
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFallbackLogo(BuildContext context) {
    return Icon(
      Icons.business,
      size: 40,
      color: context.colors.brandDefault,
    );
  }
}
