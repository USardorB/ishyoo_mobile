import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';

enum PostingAction {
  view,
  edit,
  pause,
  copy,
  share,
  archive,
  delete,
  applicants;

  String get title => switch (this) {
    PostingAction.view => 'shared.show_all'.tr(),
    PostingAction.edit => 'shared.edit'.tr(),
    PostingAction.pause => 'shared.cancel'.tr(),
    PostingAction.applicants => 'applications.title'.tr(),
    PostingAction.copy => 'shared.copy'.tr(),
    PostingAction.share => 'shared.coming_soon'.tr(),
    PostingAction.archive => 'applicants.archived'.tr(),
    PostingAction.delete => 'shared.delete'.tr(),
  };

  IconData get icon => switch (this) {
    PostingAction.view => Icons.visibility,
    PostingAction.edit => Icons.edit,
    PostingAction.pause => Icons.pause,
    PostingAction.copy => Icons.copy,
    PostingAction.share => Icons.share,
    PostingAction.archive => Icons.archive,
    PostingAction.delete => Icons.delete,
    PostingAction.applicants => Icons.people,
  };
}

class PostingActionsSheet extends StatelessWidget {
  final Vacancy vacancy;
  const PostingActionsSheet({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 12,
      ),
      children: [
        const SizedBox(height: 12),
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
              .where(
                (action) =>
                    action != PostingAction.pause &&
                    action != PostingAction.copy,
              )
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
          padding: const EdgeInsets.all(4),
          child: Icon(action.icon),
        ),
      ),
      horizontalTitleGap: 8,
      titleTextStyle: context.textThemes.buttonLarge,
      iconColor: action == PostingAction.delete
          ? context.colors.danger
          : context.colors.textSecondary,
      textColor: action == PostingAction.delete ? context.colors.danger : null,
      title: Text(action.title),
      onTap: () {
        Navigator.pop(context);
        switch (action) {
          case PostingAction.view:
            context.pushRoute(HrVacancyDetailsRoute(id: vacancy.id));
            break;
          case PostingAction.applicants:
            context.pushRoute(VacancyApplicantsRoute(vacancyId: vacancy.id));
            break;
          case PostingAction.edit:
            context.pushRoute(CreateVacancyRoute(vacancyToEdit: vacancy));
            break;
          case PostingAction.archive:
            context.read<PostingsBloc>().add(ArchivePosting(vacancy.id));
            break;
          case PostingAction.delete:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("shared.coming_soon".tr())),
            );
            break;
          case PostingAction.share:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("shared.coming_soon".tr())),
            );
            break;
          case PostingAction.pause:
          case PostingAction.copy:
            break;
        }
      },
    );
  }
}
