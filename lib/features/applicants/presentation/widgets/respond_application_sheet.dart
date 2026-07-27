import 'dart:io';

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
          title: "Birlamchi aloqa",
          subtitle: "Bu tugma rezyume ma'qul kelganda",
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyamizga yuborgan rezyumengizni ko'rib chiqdik. Sizning profilingiz bizda qiziqish uyg'otdi.\n\nKo'nikmalaringizni batafsilroq muhokama qilish uchun siz bilan 10-15 daqiqalik qisqa telefon suhbati tashkil qilmoqchimiz. Yaqin kunlar ichida sizga aloqaga chiqamiz.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
        ApplicationResponseOption(
          title: "Texnik suhbat",
          subtitle: "Team Lead yoki ekspertlar bilan chuqurroq suhbatga",
          messageTemplate:
              "Hurmatli {Name},\n\nRezyumengiz bizda qiziqish uyg'otdi. Sizni Team Lead va texnik ekspertlarimiz bilan suhbatga taklif qilamiz. Biz bilan qachon bog'lana olishingizni ma'lum qiling.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
        ApplicationResponseOption(
          title: "Rahbariyat bilan suhbat",
          subtitle: "Rahbari yoki direktor bilan uchrashuvga chaqirish",
          messageTemplate:
              "Hurmatli {Name},\n\nNomzodingiz ma'qul keldi. Sizni rahbariyat bilan bo'ladigan suhbatga taklif qilamiz. Uchrashuv vaqtini kelishib olish uchun aloqaga chiqamiz.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
      ];
    } else {
      _options = [
        ApplicationResponseOption(
          title: "Yumshoq rad",
          subtitle: "Afsuski, sizning rezyumengiz mos kelmadi...",
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyaga qiziqqaningiz uchun rahmat. Afsuski, bu safar boshqa nomzod tanlandi.\n\nKelajakda yangi imkoniyatlar uchun yana murojaat qiling.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
        ApplicationResponseOption(
          title: "Tajriba yetishmaydi",
          subtitle: "Sizning tajribangiz pozitsiya uchun yetarli emas...",
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyaga qiziqqaningiz uchun rahmat. Afsuski, tajribangiz ushbu pozitsiya uchun yetarli emas deb topildi.\n\nKelajakda yangi imkoniyatlar uchun yana murojaat qiling.\n\nHurmat bilan,\nKompaniya jamoasi",
        ),
        ApplicationResponseOption(
          title: "Boshqa nomzod tanlandi",
          subtitle: "Biz boshqa nomzodni tanladik...",
          messageTemplate:
              "Hurmatli {Name},\n\nVakansiyaga qiziqqaningiz uchun rahmat. Afsuski, biz boshqa nomzodni tanladik.\n\nKelajakda yangi imkoniyatlar uchun yana murojaat qiling.\n\nHurmat bilan,\nKompaniya jamoasi",
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
          EdgeInsets.symmetric(
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
          SizedBox(height: 4),
          Text(
            isInvite ? "Taklif qilish xati" : "Rad etish xati",
            style: context.textThemes.h5,
          ),
          SizedBox(height: 4),
          Text(
            widget.applicantName,
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 18),
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
          SizedBox(height: 4),
          Text(
            "XAT MATNI",
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 12),
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
          SizedBox(height: 24),
          AppButton(
            onTap: () {
              Navigator.pop(context, _textController.text);
            },
            label: isInvite
                ? "Taklif qilish xatini yuborish"
                : "Rad etish xatini yuborish",
            color: isInvite
                ? context.colors.brandDefault
                : context.colors.danger,
            // foregroundColor: isInvite ? context.colors.midnightImmutable : null,
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
        padding: EdgeInsets.all(12),
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
                  SizedBox(height: 6),
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
