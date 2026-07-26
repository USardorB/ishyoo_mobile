import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/vacancy.dart';
import '../../domain/repositories/vacancy_repository.dart';

part 'saved_vacancies_event.dart';
part 'saved_vacancies_state.dart';

@injectable
class SavedVacanciesBloc
    extends Bloc<SavedVacanciesEvent, SavedVacanciesState> {
  final VacancyRepository _vacancyRepository;

  SavedVacanciesBloc(this._vacancyRepository) : super(SavedVacanciesInitial()) {
    on<LoadSavedVacancies>(_onLoadSavedVacancies);
  }

  Future<void> _onLoadSavedVacancies(
    LoadSavedVacancies event,
    Emitter<SavedVacanciesState> emit,
  ) async {
    emit(SavedVacanciesLoading());
    final result = await _vacancyRepository.getSavedVacancies();
    result.fold(
      (failure) => emit(SavedVacanciesError(failure.message)),
      (vacancies) => emit(SavedVacanciesLoaded(vacancies)),
    );
  }
}
