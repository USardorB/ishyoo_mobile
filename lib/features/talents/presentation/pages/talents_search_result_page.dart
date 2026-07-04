import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

@RoutePage()
class TalentsSearchResultPage extends StatelessWidget {
  const TalentsSearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text('Qidiruv natijalari'),
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
      ),
      body: ListView(
        padding: .all(16),
        children: [
          Text(
            'Topilgan rezyumelar: 4',
            style: context.textThemes.s2,
          ),
          SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: context.colors.bgPrimary,
            minTileHeight: 64,
            leading: CircleAvatar(
              foregroundImage: CachedNetworkImageProvider(
                "https://img.magnific.com/free-psd/3d-illustration-human-avatar-profile_23-2150671134.jpg",
              ),
            ),
            title: Text("Aliqulov Rustam", style: context.textThemes.s3),
            subtitle: Text(
              "UX/UI Dizayner · Click",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.brandProgress,
              ),
              padding: .symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    '95%',
                    style: context.textThemes.b3.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                  Text(
                    "mos",
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: context.colors.bgPrimary,
            minTileHeight: 64,
            leading: CircleAvatar(
              foregroundImage: CachedNetworkImageProvider(
                "https://png.pngtree.com/png-clipart/20230927/original/pngtree-man-avatar-image-for-profile-png-image_13001877.png",
              ),
            ),
            title: Text("Malika Yusupova", style: context.textThemes.s3),
            subtitle: Text(
              "Designer · TBC Bank",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.brandProgress,
              ),
              padding: .symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    '92%',
                    style: context.textThemes.b3.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                  Text(
                    "mos",
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
