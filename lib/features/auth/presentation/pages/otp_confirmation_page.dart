import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpConfirmationPage extends HookWidget {
  static const _otpTimeDuration = 10;

  final String? phoneNumber;
  const OtpConfirmationPage({
    super.key,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();

    final remainingSeconds = useState<int>(_otpTimeDuration);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        remainingSeconds.value = _otpTimeDuration - timer.tick;
        if (remainingSeconds.value == 0) timer.cancel();
      });
      return timer.cancel;
    }, [remainingSeconds.value == _otpTimeDuration]);

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppAssets.ishYoo, height: 24),
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
                  "Yangi hisob yaratish",
                  textAlign: .center,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textThemes.h5,
                ),
                SizedBox(height: 12),
                Text(
                  'Tasdiqlash kodi $phoneNumber telefon raqamiga yuborildi',
                  textAlign: .center,
                  maxLines: 3,
                  overflow: .ellipsis,
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Pinput(
              controller: otpController,
              length: 5,
              focusedPinTheme: PinTheme(
                width: 64,
                height: 68,
                decoration: BoxDecoration(
                  color: context.colors.bgPrimary,
                  borderRadius: .circular(16),
                  border: Border.all(
                    color: context.colors.brandDefault,
                  ),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 64,
                height: 68,
                decoration: BoxDecoration(
                  color: context.colors.bgPrimary,
                  borderRadius: .circular(16),
                ),
              ),
            ),
            Align(
              child: TextButton(
                onPressed: remainingSeconds.value == 0
                    ? () => remainingSeconds.value = _otpTimeDuration
                    : null,
                style: TextButton.styleFrom(
                  disabledForegroundColor: context.colors.textSecondary,
                ),
                child: Text(
                  remainingSeconds.value == 0
                      ? 'Qayta yuborish'
                      : '00:${remainingSeconds.value}',
                ),
              ),
            ),
            Spacer(),
            AppButton(
              onTap: () => AppNotificationOverlay.instance.show(
                message: 'Saved succesasdsad as dsad asd asd assfully',
                type: .warning,
                duration: Duration(seconds: 10),
              ),
              label: 'Tasdiqlash',
            ),
            SizedBox(height: 12),
            Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
