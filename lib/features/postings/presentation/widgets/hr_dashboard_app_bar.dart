import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';

class HrDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HrDashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BlocBuilder<EmployerOrganizationBloc, EmployerOrganizationState>(
        builder: (context, state) {
          final org = state.organization;
          final initial = org?.name?.isNotEmpty == true
              ? org!.name![0].toUpperCase()
              : 'T';

          return Container(
            margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: org?.logo != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(org!.logo!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: org?.logo == null
                ? Center(
                    child: Text(
                      initial,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: context.colors.brandDefault,
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
      leadingWidth: 56,
      title: BlocBuilder<EmployerOrganizationBloc, EmployerOrganizationState>(
        builder: (context, state) {
          final org = state.organization;
          final name = org?.name ?? "";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.textThemes.s2,
              ),
              Text(
                "auth.login.hr_account",
                style: context.textThemes.c1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ).tr(),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            AppNotificationOverlay.instance.show(
              message: "shared.coming_soon".tr(),
              type: AppNotificationType.warning,
            );
          },
          icon: const Icon(Icons.support_agent),
        ),
        IconButton(
          onPressed: () => context.pushRoute(const NotificationsRoute()),
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Flexible(child: DarkGlassSearchField()),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const TallentFilterSheet(),
                ),
                icon: const Icon(Icons.tune),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);
}
