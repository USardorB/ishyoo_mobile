import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/features/location/data/models/district.dart';
import 'package:mobile/features/location/domain/usecases/get_districts_use_case.dart';

class DistrictsSheet extends HookWidget {
  final String regionId;
  const DistrictsSheet({super.key, required this.regionId});

  @override
  Widget build(BuildContext context) {
    final getDistrictsUseCase = useMemoized(() => sl<GetDistrictsUseCase>());
    final districts = useState<List<District>>([]);
    final isLoading = useState(true);
    final error = useState<String?>(null);

    useEffect(() {
      Future<void> loadDistricts() async {
        final result = await getDistrictsUseCase.call(regionId);
        if (context.mounted) {
          result.fold(
            (l) {
              error.value = l.message;
              isLoading.value = false;
            },
            (r) {
              districts.value = r;
              isLoading.value = false;
            },
          );
        }
      }

      loadDistricts();
      return null;
    }, [regionId]);

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
                      "Tumanni tanlang",
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
                  itemCount: districts.value.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final district = districts.value[index];
                    return InkWell(
                      onTap: () {
                        context.maybePop(district);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          district.nameUz ?? district.name ?? "Noma'lum tuman",
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
