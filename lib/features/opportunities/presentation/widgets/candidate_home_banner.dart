import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class CandidateHomeBanner extends HookWidget {
  const CandidateHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final banners = [
      _BannerData(
        title: "opportunities.banner.title1".tr(),
        subtitle: "opportunities.banner.subtitle1".tr(),
        buttonText: "opportunities.banner.continue".tr(),
        icon: Icons.lock_outline,
        color: context.colors.brandDefault,
        textColor: context.colors.midnightImmutable,
        buttonBgColor: Colors.white,
        buttonFgColor: context.colors.midnightImmutable,
        subtitleColor: context.colors.brandProgress,
        iconBgColor: Colors.white.withValues(alpha: 0.2),
        iconColor: Colors.black54,
      ),
      _BannerData(
        title: "opportunities.banner.title2".tr(),
        subtitle: "opportunities.banner.subtitle2".tr(),
        buttonText: "opportunities.banner.showAll".tr(),
        icon: Icons.rocket_launch_outlined,
        color: context.colors.info,
        textColor: Colors.white,
        buttonBgColor: Colors.white,
        buttonFgColor: context.colors.info,
        subtitleColor: Colors.white70,
        iconBgColor: Colors.white.withValues(alpha: 0.2),
        iconColor: Colors.white70,
      ),
      _BannerData(
        title: "opportunities.banner.title3".tr(),
        subtitle: "opportunities.banner.subtitle3".tr(),
        buttonText: "opportunities.banner.showAll".tr(),
        icon: Icons.business_outlined,
        color: context.colors.warning,
        textColor: Colors.white,
        buttonBgColor: Colors.white,
        buttonFgColor: context.colors.warning,
        subtitleColor: Colors.white70,
        iconBgColor: Colors.white.withValues(alpha: 0.2),
        iconColor: Colors.white70,
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) => currentPage.value = index,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: banner.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textThemes.s1.copyWith(
                              color: banner.textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textThemes.c1.copyWith(
                              color: banner.subtitleColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              fixedSize: const Size(102, 32),
                              backgroundColor: Colors.white,
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              banner.buttonText,
                              maxLines: 1,
                              overflow: .ellipsis,
                              style: context.textThemes.c2.copyWith(
                                color: banner.buttonFgColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: banner.iconBgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            banner.icon,
                            color: banner.iconColor,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage.value == index ? 10 : 6,
              height: currentPage.value == index ? 10 : 6,
              decoration: BoxDecoration(
                color: currentPage.value == index
                    ? context.colors.brandDefault
                    : context.colors.bgTertiary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BannerData {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color buttonBgColor;
  final Color buttonFgColor;
  final Color subtitleColor;
  final Color iconBgColor;
  final Color iconColor;

  _BannerData({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.buttonBgColor,
    required this.buttonFgColor,
    required this.subtitleColor,
    required this.iconBgColor,
    required this.iconColor,
  });
}
