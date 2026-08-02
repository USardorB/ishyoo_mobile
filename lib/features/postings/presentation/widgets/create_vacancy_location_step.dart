import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:mobile/core/configs/app_map_config.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class CreateVacancyLocationStep extends StatefulWidget {
  final TextEditingController addressController;
  final double initialLatitude;
  final double initialLongitude;
  final void Function(double lat, double lng) onLocationChanged;
  final VoidCallback onNext;

  const CreateVacancyLocationStep({
    super.key,
    required this.addressController,
    required this.initialLatitude,
    required this.initialLongitude,
    required this.onLocationChanged,
    required this.onNext,
  });

  @override
  State<CreateVacancyLocationStep> createState() =>
      _CreateVacancyLocationStepState();
}

class _CreateVacancyLocationStepState extends State<CreateVacancyLocationStep> {
  MapLibreMapController? _mapController;
  final _formKey = GlobalKey<FormState>();

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
  }

  void _onCameraIdle() {
    if (_mapController != null) {
      final pos = _mapController!.cameraPosition;
      if (pos != null) {
        widget.onLocationChanged(pos.target.latitude, pos.target.longitude);
      }
    }
  }

  void _zoomIn() {
    if (_mapController != null) {
      _mapController!.animateCamera(CameraUpdate.zoomIn());
    }
  }

  void _zoomOut() {
    if (_mapController != null) {
      _mapController!.animateCamera(CameraUpdate.zoomOut());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "opportunities.location",
                  style: context.textThemes.h5,
                ).tr(),
                const SizedBox(height: 16),
                AppInputField(
                  label: "postings.create.location".tr(),
                  controller: widget.addressController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.streetAddress,
                  validator: AppValidators.required,
                ),
                const SizedBox(height: 24),
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2E3D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      MapLibreMap(
                        styleString: AppMapConfig.styleUrl,
                        onMapCreated: _onMapCreated,
                        onCameraIdle: _onCameraIdle,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            widget.initialLatitude,
                            widget.initialLongitude,
                          ),
                          zoom: 14.0,
                        ),
                        myLocationEnabled: false,
                        trackCameraPosition: true,
                        compassEnabled: false,
                        rotateGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/locate_me.webp",
                          width: 60,
                        ),
                      ),
                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.colors.bgPrimary.withValues(
                              alpha: 0.9,
                            ),
                            borderRadius: .circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: _zoomIn,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 32,
                                color: context.colors.linePrimary,
                              ),
                              InkWell(
                                onTap: _zoomOut,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.bgPrimary.withValues(
                              alpha: 0.9,
                            ),
                            borderRadius: .circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.navigation,
                                color: context.colors.brandDefault,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "opportunities.location",
                                style: context.textThemes.b2.copyWith(
                                  color: Colors.white,
                                ),
                              ).tr(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.paddingOf(context).bottom + 16,
          ),
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: ListenableBuilder(
            listenable: widget.addressController,
            builder: (context, _) {
              return AppButton(
                label: "postings.create.continueButton".tr(),
                enabled: true,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onNext();
                  }
                },
              );
            },
          ),
        ),
      ],
      ),
    );
  }
}
