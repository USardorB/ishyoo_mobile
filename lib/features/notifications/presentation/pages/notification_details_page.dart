import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

@RoutePage()
class NotificationDetailsPage extends StatelessWidget {
  final String id;
  final String title;

  const NotificationDetailsPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: .all(16),
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: context.textThemes.s2,
          ),
          SizedBox(height: 8),
          Text(
            "21-Apr, 16:40",
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 18),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: .circular(12),
            ),
            constraints: BoxConstraints(maxHeight: 200),
            child: CachedNetworkImage(
              imageUrl: "https://picsum.photos/400/200",
              maxWidthDiskCache: 400,
              maxHeightDiskCache: 200,
            ),
          ),
          SizedBox(height: 12),
          Text(
            """2019-yilda Toshkent shahrida tashkil etilgan CAU qisqa vaqt ichida mintaqadagi eng jadal rivojlanayotgan
xususiy universitetlardan biriga aylandi.CAU global akademik makonda o‘z mavqeini izchil mustahkamlamoqda:
•
Round University Ranking jahon reytingining top-1000 taligi (2025)
•
THE Impact Rankings 2025 reytingida debyut
• 4
ta’lim va ishga joylashish ko‘rsatkichlari yuqori bo‘lgan QS Stars yulduzlari
•
AD Scientific Index ma’lumotlariga ko‘ra, O‘zbekistondagi yosh universitetlar orasida 1-o‘rin
•
2025-yilda mamlakatning eng yaxshi nodavlat universiteti deb e’tirof etilishi
Bu universitetning xalqaro
standartlar mantig‘idagi sifati va tizimli ishining tasdig‘idir. Xodimlar va nomzodlar uchun bu - ular muhitga bilan kelganliklarini anglash demakdir.""",
          ),
        ],
      ),
    );
  }
}
