import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

enum PostingAction {
  view,
  edit,
  pause,
  copy,
  share,
  archive,
  delete,
  ;

  String get title => switch (this) {
    PostingAction.view => 'Ko‘rish',
    PostingAction.edit => 'Tahrirlash',
    PostingAction.pause => 'To‘xtatish',
    PostingAction.copy => 'Nusxa olish',
    PostingAction.share => 'Ulashish',
    PostingAction.archive => 'Arxivlash',
    PostingAction.delete => 'O‘chirish',
  };

  IconData get icon => switch (this) {
    PostingAction.view => Icons.visibility,
    PostingAction.edit => Icons.edit,
    PostingAction.pause => Icons.pause,
    PostingAction.copy => Icons.copy,
    PostingAction.share => Icons.share,
    PostingAction.archive => Icons.archive,
    PostingAction.delete => Icons.delete,
  };
}

class PostingActionsSheet extends StatelessWidget {
  const PostingActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 12,
      ),
      children: [
        SizedBox(height: 12),
        Center(
          child: Container(
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              color: context.colors.bgTertiary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ...ListTile.divideTiles(
          color: context.colors.lineSecondary,
          tiles: PostingAction.values
              .where((action) => action != PostingAction.pause)
              .map((action) => listTile(context, action)),
        ),
      ],
    );
  }

  ListTile listTile(BuildContext context, PostingAction action) {
    return ListTile(
      visualDensity: .comfortable,
      contentPadding: .zero,
      leading: Material(
        color: context.colors.bgSecondary,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        child: Padding(
          padding: .all(4),
          child: Icon(action.icon),
        ),
      ),
      horizontalTitleGap: 8,
      titleTextStyle: context.textThemes.buttonLarge,
      iconColor: action == .delete
          ? context.colors.danger
          : context.colors.textSecondary,
      textColor: action == .delete ? context.colors.danger : null,
      title: Text(action.title),
    );
  }
}
