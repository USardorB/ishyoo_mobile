import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

class HrDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HrDashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'U',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: context.colors.brandDefault,
            ),
          ),
        ),
      ),
      leadingWidth: 56,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Uzum Bank",
            style: context.textThemes.s2,
          ),
          Text(
            "Ish beruvchi",
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.support_agent),
        ),
        IconButton(
          onPressed: () => context.pushRoute(NotificationsRoute()),
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Padding(
          padding: .all(16),
          child: Row(
            children: [
              Flexible(child: DarkGlassSearchField()),
              SizedBox(width: 12),
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => TallentFilterSheet(),
                ),
                icon: Icon(Icons.tune),
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
