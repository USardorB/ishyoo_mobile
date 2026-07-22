import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/profile/data/models/profile.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

class HrProfileAvatarSection extends StatelessWidget {
  final Profile? profile;
  final Organization? organization;
  const HrProfileAvatarSection({super.key, this.profile, this.organization});

  Future<void> _pickAndUploadLogo(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      context.read<EmployerOrganizationBloc>().add(
            UploadOrganizationLogo(File(pickedFile.path)),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = profile != null
        ? '${profile!.firstName ?? ''} ${profile!.lastName ?? ''}'.trim()
        : 'HR Manager';
    final initials = name.isNotEmpty
        ? name.split(' ').take(2).map((e) => e.isNotEmpty ? e[0].toUpperCase() : '').join()
        : 'HR';

    return Container(
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
              backgroundImage: organization?.logo != null
                  ? CachedNetworkImageProvider(organization!.logo!)
                  : null,
              child: organization?.logo == null
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
              const SizedBox(height: 4),
              Text(
                profile?.city ?? 'Toshkent',
                style: context.textThemes.c1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
