import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class MonthPickerSheet extends HookWidget {
  const MonthPickerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMonth = useState("Mart");
    final months = [
      "Yanvar", "Fevral", "Mart", "Aprel", "May", "Iyun", "Iyul", "Avgust", "Sentyabr", "Oktyabr", "Noyabr", "Dekabr"
    ];

    return Container(
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(width: 48), // Balance close button
                  Expanded(
                    child: Text(
                      "Oy",
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
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: months.length,
                itemBuilder: (context, index) {
                  final month = months[index];
                  final isSelected = selectedMonth.value == month;

                  return InkWell(
                    onTap: () {
                      selectedMonth.value = month;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            month,
                            style: context.textThemes.b1,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? context.colors.brandProgress : context.colors.textSecondary,
                                width: isSelected ? 6 : 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                onTap: () {
                  context.maybePop(selectedMonth.value);
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
