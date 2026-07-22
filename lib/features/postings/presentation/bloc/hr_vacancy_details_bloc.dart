import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/domain/repositories/postings_repository.dart';

// Events
abstract class HrVacancyDetailsEvent {}

class LoadHrVacancyDetail extends HrVacancyDetailsEvent {
  final String id;
  LoadHrVacancyDetail(this.id);
}

// States
abstract class HrVacancyDetailsState {}

class HrVacancyDetailsInitial extends HrVacancyDetailsState {}

class HrVacancyDetailsLoading extends HrVacancyDetailsState {}

class HrVacancyDetailsSuccess extends HrVacancyDetailsState {
  final Vacancy vacancy;
  HrVacancyDetailsSuccess(this.vacancy);
}

class HrVacancyDetailsError extends HrVacancyDetailsState {
  final String message;
  HrVacancyDetailsError(this.message);
}

// Bloc
@injectable
class HrVacancyDetailsBloc extends Bloc<HrVacancyDetailsEvent, HrVacancyDetailsState> {
  final PostingsRepository _repository;

  HrVacancyDetailsBloc(this._repository) : super(HrVacancyDetailsInitial()) {
    on<LoadHrVacancyDetail>(_onLoad);
  }

  Future<void> _onLoad(LoadHrVacancyDetail event, Emitter<HrVacancyDetailsState> emit) async {
    emit(HrVacancyDetailsLoading());
    final result = await _repository.getVacancyDetail(event.id);
    result.fold(
      (failure) => emit(HrVacancyDetailsError(failure.message)),
      (vacancy) => emit(HrVacancyDetailsSuccess(vacancy)),
    );
  }
}
