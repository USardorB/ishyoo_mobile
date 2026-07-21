import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../data/models/vacancy.dart';
import '../../domain/usecases/get_nearby_jobs_usecase.dart';

part 'nearby_jobs_event.dart';
part 'nearby_jobs_state.dart';

@injectable
class NearbyJobsBloc extends Bloc<NearbyJobsEvent, NearbyJobsState> {
  final GetNearbyJobsUseCase _getNearbyJobsUseCase;

  NearbyJobsBloc(this._getNearbyJobsUseCase)
      : super(const NearbyJobsInitial()) {
    on<LoadNearbyJobs>(_onLoadNearbyJobs);
  }

  Future<void> _onLoadNearbyJobs(
    LoadNearbyJobs event,
    Emitter<NearbyJobsState> emit,
  ) async {
    emit(const NearbyJobsLoading());

    double latitude = 41.311646; // Tashkent fallback
    double longitude = 69.27975;

    try {
      final location = Location();
      
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          emit(const NearbyJobsLocationError('Joylashuv xizmatlari o\'chirilgan.'));
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted && 
            permissionGranted != PermissionStatus.grantedLimited) {
          emit(const NearbyJobsLocationError('Joylashuvga ruxsat berilmadi.'));
          return;
        }
      }

      if (permissionGranted == PermissionStatus.granted || 
          permissionGranted == PermissionStatus.grantedLimited) {
        // Reduced timeout to 1 second to avoid long loading delays on emulators without a GPS fix
        final locData = await location.getLocation().timeout(const Duration(seconds: 1));
        if (locData.latitude != null && locData.longitude != null) {
          latitude = locData.latitude!;
          longitude = locData.longitude!;
        }
      }
    } catch (e) {
      // Ignore location errors and use fallback
    }

    final params = GetNearbyJobsParams(
      latitude: latitude,
      longitude: longitude,
      radius: event.radius,
      limit: event.limit,
    );

    final result = await _getNearbyJobsUseCase(params);

    result.fold(
      (failure) => emit(NearbyJobsError(failure.message)),
      (vacancies) => emit(NearbyJobsLoaded(vacancies, event.radius)),
    );
  }
}
