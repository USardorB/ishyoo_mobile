import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/settings/presentation/bloc/settings_bloc.dart';

class ConfigureNotificationPreferencesSheet extends StatelessWidget {
  const ConfigureNotificationPreferencesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SettingsBloc>()..add(LoadSettings()),
      child: const _SheetContent(),
    );
  }
}

class _SheetContent extends StatefulWidget {
  const _SheetContent();

  @override
  State<_SheetContent> createState() => _SheetContentState();
}

class _SheetContentState extends State<_SheetContent> {
  bool _smsEnabled = false;
  bool _applicationUpdates = true;
  bool _messages = true;
  bool _interviews = true;
  bool _recommendations = true;
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (!_initialized &&
            state.settings?.notifications != null &&
            state.settings!.notifications!.isNotEmpty) {
          final notif = state.settings!.notifications!.first;
          setState(() {
            _smsEnabled = notif.smsEnabled ?? false;
            _applicationUpdates = notif.applicationUpdates ?? true;
            _messages = notif.messages ?? true;
            _interviews = notif.interviews ?? true;
            _recommendations = notif.recommendations ?? true;
            _initialized = true;
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: context.colors.bgTertiary.withValues(alpha: .75),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "settings.notifications",
                    style: context.textThemes.h5,
                  ).tr(),
                  IconButton(
                    onPressed: context.pop,
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
            if (state.isLoading && !_initialized)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              )
            else
              ...ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: Text(
                      "settings.notifications",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Switch.adaptive(
                      applyCupertinoTheme: true,
                      value: _smsEnabled,
                      onChanged: (value) => setState(() => _smsEnabled = value),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "applications.title",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Switch.adaptive(
                      applyCupertinoTheme: true,
                      value: _applicationUpdates,
                      onChanged: (value) =>
                          setState(() => _applicationUpdates = value),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "nav.chats",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Switch.adaptive(
                      applyCupertinoTheme: true,
                      value: _messages,
                      onChanged: (value) => setState(() => _messages = value),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "applications.status.interview",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: Switch.adaptive(
                      applyCupertinoTheme: true,
                      value: _interviews,
                      onChanged: (value) => setState(() => _interviews = value),
                    ),
                  ),
                ],
              ),
            SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: AppButton(
                onTap: () {
                  context.read<SettingsBloc>().add(
                    UpdateNotificationSettings({
                      'sms_enabled': _smsEnabled,
                      'application_updates': _applicationUpdates,
                      'messages': _messages,
                      'interviews': _interviews,
                      'recommendations': _recommendations,
                    }),
                  );
                  context.pop();
                },
                label: "shared.apply".tr(),
              ),
            ),
          ],
        );
      },
    );
  }
}
