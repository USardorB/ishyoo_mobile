import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

class ChatItem extends StatelessWidget {
  final String image;
  final String title;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int unreadCount;
  const ChatItem({
    super.key,
    required this.image,
    required this.title,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushRoute(ChatDetailsRoute()),
      child: Padding(
        padding: .symmetric(vertical: 10),
        child: Row(
          children: [
            Flexible(
              child: Row(
                children: [
                  Badge(
                    isLabelVisible: isOnline,
                    backgroundColor: context.colors.brightMutable,
                    padding: .all(1),
                    alignment: Alignment(.8, .7),
                    label: Icon(
                      Icons.circle,
                      size: 16,
                      color: context.colors.success,
                    ),
                    child: ClipRRect(
                      borderRadius: .circular(26),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Padding(
                      padding: .symmetric(horizontal: 5),
                      child: Column(
                        mainAxisSize: .min,
                        spacing: 6,
                        crossAxisAlignment: .start,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: context.textThemes.s3,
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              lastMessage,
                              style: context.textThemes.b2.copyWith(
                                color: context.colors.textSecondary,
                              ),
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: .min,
              crossAxisAlignment: .end,
              spacing: 6,
              children: [
                Text(time, style: context.textThemes.b3),
                if (unreadCount > 0)
                  Container(
                    padding: .all(6),
                    decoration: BoxDecoration(
                      color: context.colors.brandDefault,
                      shape: .circle,
                    ),

                    child: Text(
                      unreadCount.toString(),
                      style: context.textThemes.c2.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
