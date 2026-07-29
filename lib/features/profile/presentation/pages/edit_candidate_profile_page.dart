import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/profile/data/models/profile.dart';
import 'package:mobile/features/profile/presentation/bloc/candidate_profile_bloc.dart';

@RoutePage()
class EditCandidateProfilePage extends StatefulWidget {
  const EditCandidateProfilePage({super.key});

  @override
  State<EditCandidateProfilePage> createState() =>
      _EditCandidateProfilePageState();
}

class _EditCandidateProfilePageState extends State<EditCandidateProfilePage> {
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _birthDateCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();

  bool _initialized = false;

  void _populateFromProfile(Profile profile) {
    if (_initialized) return;
    _firstNameCtrl.text = profile.firstName ?? '';
    _lastNameCtrl.text = profile.lastName ?? '';
    _emailCtrl.text = profile.email ?? '';
    _phoneCtrl.text = profile.phoneNumber ?? '';
    _cityCtrl.text = profile.city ?? '';
    _birthDateCtrl.text = profile.birthDate ?? '';
    _bioCtrl.text = profile.bio ?? '';
    _initialized = true;
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _cityCtrl.dispose();
    _birthDateCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  void _save(BuildContext context) {
    context.read<CandidateProfileBloc>().add(
      UpdateCandidateProfile({
        'first_name': _firstNameCtrl.text.trim(),
        'last_name': _lastNameCtrl.text.trim(),
        'email': _emailCtrl.text.trim(),
        'phone_number': _phoneCtrl.text.trim(),
        'city': _cityCtrl.text.trim(),
        'birth_date': _birthDateCtrl.text.trim(),
        'bio': _bioCtrl.text.trim(),
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CandidateProfileBloc>()..add(LoadCandidateProfile()),
      child: BlocConsumer<CandidateProfileBloc, CandidateProfileState>(
        listener: (context, state) {
          if (state.profile != null) _populateFromProfile(state.profile!);
          if (state.isUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('shared.saved_success'.tr())),
            );
            context.maybePop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        builder: (context, state) {
          final initials = [
            (_firstNameCtrl.text.isNotEmpty ? _firstNameCtrl.text[0] : ''),
            (_lastNameCtrl.text.isNotEmpty ? _lastNameCtrl.text[0] : ''),
          ].join().toUpperCase();

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.maybePop(),
              ),
              title: const Text("profile.edit_profile").tr(),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: state.isUpdating ? null : () => _save(context),
                  child: state.isUpdating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          "shared.save",
                          style: context.textThemes.b2.copyWith(
                            color: context.colors.brandProgress,
                          ),
                        ).tr(),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: MediaQuery.paddingOf(context).bottom + 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: context.colors.bgSecondary,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            initials.isEmpty ? 'U' : initials,
                            style: context.textThemes.h4.copyWith(
                              color: context.colors.brandProgress,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: context.colors.bgTertiary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: AppInputField(
                          label: "auth.register.full_name_hint".tr(),
                          controller: _firstNameCtrl,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppInputField(
                          label: "auth.complete_profile.last_name_hint".tr(),
                          controller: _lastNameCtrl,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: "Email",
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: "auth.login.phone_label".tr(),
                    controller: _phoneCtrl,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: "opportunities.location".tr(),
                    controller: _cityCtrl,
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: "auth.complete_profile.birth_date_hint".tr(),
                    controller: _birthDateCtrl,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        _birthDateCtrl.text =
                            '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                      }
                    },
                    suffixIcon: Icon(
                      Icons.chevron_right,
                      color: context.colors.textSecondary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: "profile.about_me".tr(),
                    controller: _bioCtrl,
                    maxLines: 4,
                    minLines: 4,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onTap: () => _save(context),
                    enabled: !state.isUpdating,
                    label: 'shared.save'.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
