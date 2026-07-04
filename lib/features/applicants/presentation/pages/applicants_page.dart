import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_listing_item.dart';

@RoutePage()
class ApplicantsPage extends StatelessWidget {
  const ApplicantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Applicants'),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            automaticIndicatorColorAdjustment: true,
            splashBorderRadius: .circular(20),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 16),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.colors.brandProgress,
            ),
            labelPadding: .symmetric(horizontal: 12, vertical: 8),
            tabAlignment: TabAlignment.start,
            tabs: [
              Text('Ko‘rilmaganlar (89)'),
              Text('Taklif etilganlar (5)'),
              Text('To‘g‘ri kelmaydi (8)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: .all(16),
              child: Column(
                spacing: 12,
                children: [
                  ApplicantListingItem(),
                  ApplicantListingItem(),
                ],
              ),
            ),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
