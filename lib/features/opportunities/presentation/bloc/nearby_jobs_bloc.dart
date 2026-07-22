import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:geolocator/geolocator.dart';

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
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          const NearbyJobsLocationError('Joylashuv xizmatlari o\'chirilgan.'),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const NearbyJobsLocationError('Joylashuvga ruxsat berilmadi.'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(const NearbyJobsLocationError('Joylashuvga ruxsat butunlay cheklangan.'));
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          timeLimit: Duration(seconds: 1),
        ),
      );
      latitude = position.latitude;
      longitude = position.longitude;
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
