import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

@RoutePage()
class CompleteProfilePage extends HookWidget {
  const CompleteProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController(text: '');
    final lastNameController = useTextEditingController();
    final companyNameController = useTextEditingController();
    final birthDateController = useTextEditingController();

    final isCompany = context.read<AuthCubit>().state.role == .employer;

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.ishYoo,
          height: 24,
        ),
      ),
      body: SafeArea(
        minimum: .all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: .stretch,
              children: [
                Text(
                  "Shaxsiy ma’lumotlar",
                  textAlign: .center,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textThemes.h5,
                ),
                SizedBox(height: 12),
                Text(
                  "Shaxsiy ma’lumotlarni kiriting Foydalanuvchining ismi, familiyasi va tkompaniya nomi",
                  textAlign: .center,
                  maxLines: 3,
                  overflow: .ellipsis,
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            AppInputField(
              hintText: "Ismingizni kiriting",
              autofillHints: [AutofillHints.name],
              textInputAction: TextInputAction.continueAction,
              keyboardType: TextInputType.name,
              controller: firstNameController,
            ),
            SizedBox(height: 12),
            AppInputField(
              hintText: "Familiyangizni kiriting",
              autofillHints: [AutofillHints.familyName],
              textInputAction: TextInputAction.continueAction,
              keyboardType: TextInputType.name,
              controller: lastNameController,
            ),
            if (isCompany) ...[
              SizedBox(height: 12),
              AppInputField(
                hintText: "Kompaniya nomi",
                autofillHints: [AutofillHints.organizationName],
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                controller: companyNameController,
              ),
            ] else ...[
              SizedBox(height: 12),
              AppInputField(
                hintText: "Tug’ilgan sana (YYYY.OO.KK)",
                textInputAction: TextInputAction.done,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.tryParse(birthDateController.text),
                    currentDate: DateTime.now(),
                  );
                  if (date == null) return;
                  birthDateController.value = TextEditingValue(
                    text: DateFormat('yyyy.MM.dd').format(date),
                  );
                },
                controller: birthDateController,
              ),
            ],
            Spacer(),
            AppButton(
              onTap: () => context.router.replaceAll([const MainLayoutRoute()]),
              label: 'Davom etish',
            ),
            Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
