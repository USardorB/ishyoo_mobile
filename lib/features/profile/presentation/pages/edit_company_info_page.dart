import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
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

  void _save(BuildContext context) {
    context.read<EmployerOrganizationBloc>().add(
      UpdateEmployerOrganization({
        'name': _nameCtrl.text.trim(),
        'industry': _industryCtrl.text.trim(),
        'size': num.parse(_sizeCtrl.text.trim()).toInt(),
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
          if (state.organization != null)
            _populateFromOrganization(state.organization!);
          if (state.isUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Muvaffaqiyatli saqlandi')),
            );
            context.maybePop();
          }
          if (state.error != null &&
              state.updateStatus == EmployerOrganizationUpdateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
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
              title: const Text('Kompaniya tahriri'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppInputField(
                    label: 'KOMPANIYA NOMI',
                    controller: _nameCtrl,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'SOHA (INDUSTRY)',
                    controller: _industryCtrl,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'XODIMLAR SONI',
                    keyboardType: TextInputType.number,
                    controller: _sizeCtrl,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'VEB-SAYT',
                    controller: _websiteCtrl,
                    keyboardType: TextInputType.url,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: 'MANZIL',
                    controller: _locationCtrl,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    label: "KOMPANIYA HAQIDA BATAFSIL",
                    minLines: 4,
                    maxLines: 6,
                    controller: _descriptionCtrl,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    onTap: state.isUpdating ? () {} : () => _save(context),
                    enabled: !state.isUpdating,
                    label: 'Saqlash',
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
