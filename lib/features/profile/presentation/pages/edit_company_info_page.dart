import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

@RoutePage()
class EditCompanyInfoPage extends StatefulWidget {
  const EditCompanyInfoPage({super.key});

  @override
  State<EditCompanyInfoPage> createState() => _EditCompanyInfoPageState();
}

class _EditCompanyInfoPageState extends State<EditCompanyInfoPage> {
  final _nameCtrl = TextEditingController();
  final _industryCtrl = TextEditingController();
  final _sizeCtrl = TextEditingController();
  final _websiteCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();

  bool _initialized = false;

  void _populateFromOrganization(Organization org) {
    if (_initialized) return;
    _nameCtrl.text = org.name ?? '';
    _industryCtrl.text = org.industry ?? '';
    _sizeCtrl.text = org.size?.toString() ?? '';
    _websiteCtrl.text = org.website ?? '';
    _descriptionCtrl.text = org.description ?? '';
    _locationCtrl.text = org.location ?? '';
    _initialized = true;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _industryCtrl.dispose();
    _sizeCtrl.dispose();
    _websiteCtrl.dispose();
    _descriptionCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void _save(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    context.read<EmployerOrganizationBloc>().add(
      UpdateEmployerOrganization({
        'name': _nameCtrl.text.trim(),
        'industry': _industryCtrl.text.trim(),
        'size': num.tryParse(_sizeCtrl.text.trim())?.toInt() ?? 0,
        'website': _websiteCtrl.text.trim(),
        'description': _descriptionCtrl.text.trim(),
        'location': _locationCtrl.text.trim(),
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<EmployerOrganizationBloc>()..add(LoadEmployerOrganization()),
      child: BlocConsumer<EmployerOrganizationBloc, EmployerOrganizationState>(
        listener: (context, state) {
          if (state.organization != null) {
            _populateFromOrganization(state.organization!);
          }
          if (state.isUpdateSuccess) {
            AppNotificationOverlay.instance.show(
              message: 'profile.savedSuccess'.tr(),
              type: AppNotificationType.success,
            );
            context.maybePop();
          }
          if (state.error != null &&
              state.updateStatus == EmployerOrganizationUpdateStatus.error) {
            AppNotificationOverlay.instance.show(
              message: state.error!,
              type: AppNotificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.organization == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('profile.company.edit').tr(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppInputField(
                    label: 'profile.company.nameHint'.tr(),
                    controller: _nameCtrl,
                    validator: AppValidators.required,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.organizationName],
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'profile.company.fieldOfActivity'.tr(),
                    controller: _industryCtrl,
                    validator: AppValidators.required,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'profile.company.filterTitle'.tr(),
                    keyboardType: TextInputType.number,
                    controller: _sizeCtrl,
                    validator: AppValidators.required,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'WEBSITE',
                    controller: _websiteCtrl,
                    keyboardType: TextInputType.url,
                    validator: (v) => AppValidators.url(v, isRequired: false),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.url],
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'profile.company.location'.tr(),
                    controller: _locationCtrl,
                    validator: AppValidators.required,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.streetAddress,
                    autofillHints: const [AutofillHints.fullStreetAddress],
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'profile.company.about'.tr(),
                    minLines: 4,
                    maxLines: 6,
                    maxLength: 1000,
                    controller: _descriptionCtrl,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onTap: state.isUpdating ? () {} : () => _save(context),
                    enabled: !state.isUpdating,
                    label: 'profile.save'.tr(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}
