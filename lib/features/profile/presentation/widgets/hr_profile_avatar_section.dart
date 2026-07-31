import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';
import 'package:mobile/features/profile/data/models/profile.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_profile_bloc.dart';

class HrProfileAvatarSection extends StatelessWidget {
  final Profile? profile;
  final Organization? organization;
  const HrProfileAvatarSection({super.key, this.profile, this.organization});

  Future<void> _pickAndUploadLogo(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxWidth: 720,
      maxHeight: 720,
    );
    if (pickedFile != null && context.mounted) {
      context.read<EmployerOrganizationBloc>().add(
        UploadOrganizationLogo(File(pickedFile.path)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = profile != null
        ? (profile!.name ??
                  '${profile!.firstName ?? ''} ${profile!.lastName ?? ''}')
              .trim()
        : 'HR Manager';
    final initials = name.isNotEmpty
        ? name
              .split(' ')
              .take(2)
              .map((e) => e.isNotEmpty ? e[0].toUpperCase() : '')
              .join()
        : 'HR';

    return BlocListener<EmployerOrganizationBloc, EmployerOrganizationState>(
      listenWhen: (previous, current) =>
          previous.updateStatus != EmployerOrganizationUpdateStatus.success &&
          current.updateStatus == EmployerOrganizationUpdateStatus.success &&
          previous.organization?.logo != current.organization?.logo &&
          current.organization?.logo != null,
      listener: (context, state) {
        if (state.organization?.logo != null) {
          context.read<EmployerProfileBloc>().add(
            UpdateEmployerProfileData({
              if (organization?.name != null)
                'company_name': organization!.name,
              if (organization?.industry != null)
                'industry': organization!.industry,
              if (organization?.location != null)
                'location': organization!.location,
              if (organization?.website != null)
                'website': organization!.website,
              if (profile?.phoneNumber != null)
                'phone_number': profile!.phoneNumber,
              if (organization?.description != null)
                'bio': organization!.description,
              'avatar_url': state.organization!.logo,
            }),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => _pickAndUploadLogo(context),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: context.colors.bgSecondary,
                backgroundImage: profile?.avatarUrl != null
                    ? CachedNetworkImageProvider(profile!.avatarUrl!)
                    : null,
                child: profile?.avatarUrl == null
                    ? Text(
                        initials,
                        style: context.textThemes.h5.copyWith(
                          color: context.colors.brandDefault,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: context.textThemes.s1),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.check_circle_rounded,
                      color: context.colors.brandDefault,
                    ),
                  ],
                ),
                if (profile?.email != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    profile!.email!,
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ] else if (profile?.phoneNumber != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    profile!.phoneNumber!,
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
