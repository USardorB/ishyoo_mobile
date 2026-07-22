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
        title: "Orzuingizdagi ishni\ntoping",
        subtitle: "Lorem Ipsum is simply",
        buttonText: "Get started",
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
        title: "Karyerangizni\nrivojlantiring",
        subtitle: "Yangi imkoniyatlar",
        buttonText: "Batafsil",
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
        title: "Kompaniyalar bilan\ntanishuv",
        subtitle: "Eng yaxshi ish beruvchilar",
        buttonText: "Ko'rish",
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
          height: 180,
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
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title,
                            style: context.textThemes.s1.copyWith(
                              color: banner.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            banner.subtitle,
                            style: context.textThemes.c1.copyWith(
                              color: banner.subtitleColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Tez orada qo'shiladi")),
                              );
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: banner.buttonBgColor,
                              foregroundColor: banner.buttonFgColor,
                              textStyle: context.textThemes.b3,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: Text(banner.buttonText),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
              width: currentPage.value == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentPage.value == index
                    ? context.colors.brandDefault
                    : context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(4),
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
