import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class MonthPickerSheet extends HookWidget {
  final DateTime? initialDate;
  const MonthPickerSheet({super.key, this.initialDate});

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime>(initialDate ?? DateTime.now());

    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(width: 48), // Balance close button
                  Expanded(
                    child: Text(
                      "Sana tanlang",
                      textAlign: TextAlign.center,
                      style: context.textThemes.s1,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.maybePop(),
                    icon: Icon(Icons.close, color: context.colors.textPrimary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: context.textThemes.h5.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.monthYear,
                  initialDateTime: selectedDate.value,
                  minimumYear: 1950,
                  maximumYear: DateTime.now().year + 5,
                  onDateTimeChanged: (date) {
                    selectedDate.value = date;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                onTap: () {
                  context.maybePop(selectedDate.value);
                },
                label: "Qo'llash",
                color: context.colors.brandProgress,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
