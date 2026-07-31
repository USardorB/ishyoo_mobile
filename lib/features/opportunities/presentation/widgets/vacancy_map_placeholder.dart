import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:mobile/core/configs/app_map_config.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class VacancyMap extends StatefulWidget {
  final double latitude;
  final double longitude;

  const VacancyMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<VacancyMap> createState() => _VacancyMapState();
}

class _VacancyMapState extends State<VacancyMap> {
  MapLibreMapController? _mapController;

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
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
    return Container(
      height: 200,
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
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitude, widget.longitude),
              zoom: 14.0,
            ),
            myLocationEnabled: false,
            trackCameraPosition: true,
            compassEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            scrollGesturesEnabled: false, // Static map for details view
            zoomGesturesEnabled: false,
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
                color: context.colors.bgPrimary.withValues(alpha: 0.9),
                borderRadius: .circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: _zoomIn,
                    child: const Padding(
                      padding: .all(10.0),
                      child: Icon(Icons.add, color: Colors.white, size: 20),
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
                      padding: .all(10.0),
                      child: Icon(Icons.remove, color: Colors.white, size: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: context.colors.bgPrimary.withValues(alpha: 0.9),
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
                    style: context.textThemes.b2.copyWith(color: Colors.white),
                  ).tr(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
