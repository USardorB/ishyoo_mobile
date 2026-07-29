import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/domain/usecases/get_regions_use_case.dart';

class RegionsSheet extends HookWidget {
  const RegionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final getRegionsUseCase = useMemoized(() => sl<GetRegionsUseCase>());
    final regions = useState<List<Region>>([]);
    final isLoading = useState(true);
    final error = useState<String?>(null);

    useEffect(() {
      Future<void> loadRegions() async {
        final result = await getRegionsUseCase.call(NoParam());
        if (context.mounted) {
          result.fold(
            (l) {
              error.value = l.message;
              isLoading.value = false;
            },
            (r) {
              regions.value = r;
              isLoading.value = false;
            },
          );
        }
      }

      loadRegions();
      return null;
    }, const []);

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
                  const SizedBox(width: 48),
                  Expanded(
                    child: Text(
                      "opportunities.location",
                      textAlign: TextAlign.center,
                      style: context.textThemes.s1,
                    ).tr(),
                  ),
                  IconButton(
                    onPressed: () => context.maybePop(),
                    icon: Icon(Icons.close, color: context.colors.textPrimary),
                  ),
                ],
              ),
            ),
            if (isLoading.value)
              const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (error.value != null)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Text(
                    error.value!,
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.danger,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: regions.value.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final region = regions.value[index];
                    return InkWell(
                      onTap: () {
                        context.maybePop(region);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          region.nameUz ?? region.name ?? "",
                          style: context.textThemes.b1,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
