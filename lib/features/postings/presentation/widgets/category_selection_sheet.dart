import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class CategorySelectionSheet extends StatelessWidget {
  const CategorySelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          SizedBox(height: 16),
          _buildHeader(context),
          SizedBox(height: 18),
          AppInputField(
            hintText: "Qidirish",
            prefixIcon: Icon(Icons.search, color: context.colors.textSecondary),
          ),
          SizedBox(height: 16),
          _buildCategoryItem(context, Icons.code, 'Dasturchi', '3 542 ta vakansiya'),
          _buildCategoryItem(context, Icons.campaign, 'Marketing', '892 ta vakansiya'),
          _buildCategoryItem(context, Icons.shopping_bag, 'Sotuv', '1 105 ta vakansiya'),
          _buildCategoryItem(context, Icons.manage_accounts, 'Boshqaruv', '418 ta vakansiya'),
          _buildCategoryItem(context, Icons.account_balance_wallet, 'Moliya', '623 ta vakansiya'),
          _buildCategoryItem(context, Icons.people, 'HR', '287 ta vakansiya'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, IconData icon, String title, String subtitle) {
    return ListTile(
      onTap: () {
        context.pop(title);
      },
      contentPadding: EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: context.colors.textSecondary),
      ),
      title: Text(title, style: context.textThemes.s2),
      subtitle: Text(
        subtitle,
        style: context.textThemes.b3.copyWith(color: context.colors.textSecondary),
      ),
    );
  }

  Row _buildHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 48), // Balance for centering
          Expanded(
            child: Text(
              'Kategoriya tanlang',
              style: context.textThemes.h5,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 48,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                onPressed: context.pop,
                icon: Icon(Icons.close),
              ),
            ),
          ),
        ],
      );
}
