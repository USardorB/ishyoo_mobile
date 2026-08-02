import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

enum ApplicationResponseType {
  invite,
  reject,
}

class ApplicationResponseOption {
  final String title;
  final String subtitle;
  final String messageTemplate;

  const ApplicationResponseOption({
    required this.title,
    required this.subtitle,
    required this.messageTemplate,
  });
}

class RespondApplicationSheet extends StatefulWidget {
  final ApplicationResponseType type;
  final String applicantName;

  const RespondApplicationSheet({
    super.key,
    required this.type,
    required this.applicantName,
  });

  @override
  State<RespondApplicationSheet> createState() =>
      _RespondApplicationSheetState();
}

class _RespondApplicationSheetState extends State<RespondApplicationSheet> {
  late final List<ApplicationResponseOption> _options;
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.type == ApplicationResponseType.invite) {
      _options = [
        ApplicationResponseOption(
          title: "applicants.actions.invite".tr(),
          subtitle: "applicants.actions.invited".tr(),
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyamizga yuborgan rezyumengizni ko'rib chiqdik. Sizning profilingiz bizda qiziqish uyg'otdi.\n\nKo'nikmalaringizni batafsilroq muhokama qilish uchun siz bilan 10-15 daqiqalik qisqa telefon suhbati tashkil qilmoqchimiz. Yaqin kunlar ichida sizga aloqaga chiqamiz.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
      ];
    } else {
      _options = [
        ApplicationResponseOption(
          title: "applicants.actions.reject".tr(),
          subtitle: "applicants.actions.unsuitable".tr(),
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyaga qiziqqaningiz uchun rahmat. Afsuski, bu safar boshqa nomzod tanlandi.\n\nKelajakda yangi imkoniyatlar uchun yana murojaat qiling.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
      ];
    }

    _updateText();
  }

  void _updateText() {
    final template = _options[_selectedIndex].messageTemplate;
    _textController.text = template.replaceAll('{Name}', widget.applicantName);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = Platform.isIOS ? 12.0 : MediaQuery.paddingOf(context).bottom;
    final isInvite = widget.type == ApplicationResponseType.invite;

    return Padding(
      padding:
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ).copyWith(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16 + bottom,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandler(context),
          const SizedBox(height: 4),
          Text(
            isInvite ? "applicants.actions.invite" : "applicants.actions.rejectTitle",
            style: context.textThemes.h5,
          ).tr(),
          const SizedBox(height: 4),
          Text(
            widget.applicantName,
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 18),
          ...List.generate(_options.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildApplicationResponseOption(
                context,
                index: index,
                option: _options[index],
              ),
            );
          }),
          const SizedBox(height: 4),
          Text(
            "applicants.messaging.typeMessage".tr(),
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              fillColor: context.colors.bgCard,
              filled: true,
            ),
            minLines: 4,
            maxLines: 6,
          ),
          const SizedBox(height: 24),
          AppButton(
            onTap: () {
              Navigator.pop(context, _textController.text);
            },
            label: isInvite
                ? "applicants.actions.invite".tr()
                : "applicants.actions.cancel".tr(),
            color: isInvite
                ? context.colors.brandDefault
                : context.colors.danger,
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationResponseOption(
    BuildContext context, {
    required int index,
    required ApplicationResponseOption option,
  }) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _updateText();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? context.colors.brandDefault
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(option.title, style: context.textThemes.s3),
                  const SizedBox(height: 6),
                  Text(
                    option.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? context.colors.brandDefault
                  : context.colors.lineSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandler(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Align(
      child: Container(
        width: 60,
        height: 6,
        decoration: BoxDecoration(
          color: context.colors.bgTertiary.withValues(alpha: .75),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );
}
