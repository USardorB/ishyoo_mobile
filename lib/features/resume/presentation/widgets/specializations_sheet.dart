import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/features/resume/data/models/specialization.dart';
import 'package:mobile/features/resume/domain/usecases/get_specializations_use_case.dart';

class SpecializationsSheet extends StatefulWidget {
  const SpecializationsSheet({super.key});

  @override
  State<SpecializationsSheet> createState() => _SpecializationsSheetState();
}

class _SpecializationsSheetState extends State<SpecializationsSheet> {
  final _getSpecializationsUseCase = sl<GetSpecializationsUseCase>();

  List<Specialization>? _specializations;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSpecializations();
  }

  Future<void> _loadSpecializations() async {
    final result = await _getSpecializationsUseCase.call(NoParam());

    if (mounted) {
      result.fold(
        (l) {
          setState(() {
            _error = l.message;
          });
        },
        (r) {
          setState(() {
            _specializations = r;
          });
        },
      );
    }
  }

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
            "talents.search_placeholder",
            style: context.textThemes.h3,
          ).tr(),
          const SizedBox(height: 24),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _error!,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.danger,
                ),
              ),
            )
          else if (_specializations == null)
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
                itemCount: _specializations!.length,
                separatorBuilder: (context, index) => Divider(
                  color: context.colors.bgTertiary,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final spec = _specializations![index];
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
