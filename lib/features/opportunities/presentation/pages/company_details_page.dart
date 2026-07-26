import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';
import 'package:cached_network_image/cached_network_image.dart';

@RoutePage()
class CompanyDetailsPage extends StatelessWidget {
  final Organization organization;

  const CompanyDetailsPage({super.key, required this.organization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              const SizedBox(height: 32),

              // Description
              if (organization.description != null &&
                  organization.description!.isNotEmpty) ...[
                Text(
                  "Kompaniya haqida",
                  style: context.textThemes.s1,
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
