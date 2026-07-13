import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applications/presentation/widgets/application_card.dart';

@RoutePage()
class ApplicationsPage extends HookWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      "Barchasi",
      "Suhbat",
      "Kutilmoqda",
      "Rad etildi",
      "Saralanganlar",
    ];
    final tabController = useTabController(initialLength: tabs.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Javoblar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: .circular(32),
                border: BoxBorder.all(color: context.colors.linePrimary),
              ),
              child: ClipRRect(
                borderRadius: .circular(32),
                child: TabBar(
                  splashBorderRadius: .circular(32),
                  controller: tabController,
                  isScrollable: true,
                  tabAlignment: .start,
                  dividerColor: Colors.transparent,
                  padding: .symmetric(horizontal: 6, vertical: 4),
                  indicatorSize: .tab,
                  indicator: BoxDecoration(
                    color: context.colors.brandProgress,
                    borderRadius: .circular(32),
                  ),
                  labelColor: context.colors.brandDefault,
                  unselectedLabelColor: context.colors.textSecondary,
                  labelStyle: context.textThemes.buttonMedium,
                  unselectedLabelStyle: context.textThemes.buttonMedium,
                  tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(tabs.length, (tabIndex) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                    bottom: MediaQuery.paddingOf(context).bottom + 16,
                  ),
                  itemCount: 4,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    // Mock data for UI demonstration
                    return ApplicationCard(
                      status: tabIndex == 3
                          ? "Rad etildi"
                          : (index % 2 == 0 ? "Ko'rib chiqdi" : "Ko'rilmadi"),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
