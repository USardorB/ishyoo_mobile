import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/specialization.dart';

class CategorySelectionSheet extends StatelessWidget {
  final List<Specialization> specializations;
  const CategorySelectionSheet({super.key, required this.specializations});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Mutaxassisliklar",
            style: context.textThemes.h3,
          ),
          const SizedBox(height: 24),
          if (specializations.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(child: CircularProgressIndicator()),
            )
          else
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: specializations.length,
                separatorBuilder: (context, index) => Divider(
                  color: context.colors.bgTertiary,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final spec = specializations[index];
                  if (spec.children != null && spec.children!.isNotEmpty) {
                    return ExpansionTile(
                      title: Text(spec.name, style: context.textThemes.b2),
                      children: spec.children!
                          .map(
                            (child) => ListTile(
                              title: Text(
                                child.name,
                                style: context.textThemes.b2,
                              ),
                              onTap: () =>
                                  Navigator.of(context).pop(child.name),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return ListTile(
                    title: Text(spec.name, style: context.textThemes.b2),
                    onTap: () => Navigator.of(context).pop(spec.name),
                  );
                },
              ),
            ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
        ],
      ),
    );
  }
}
