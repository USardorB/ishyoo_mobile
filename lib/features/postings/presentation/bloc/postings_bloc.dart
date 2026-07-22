import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../opportunities/data/models/vacancy.dart';
import '../../domain/repositories/postings_repository.dart';
import '../../data/models/employer_stats.dart';
import '../../../../core/shared/failures.dart';
import '../../../resume/data/models/specialization.dart';

abstract class PostingsEvent {}

class LoadPostings extends PostingsEvent {}

class LoadMorePostings extends PostingsEvent {}

class CreatePosting extends PostingsEvent {
  final Map<String, dynamic> body;
  CreatePosting(this.body);
}

class UpdatePosting extends PostingsEvent {
  final String id;
  final Map<String, dynamic> body;
  UpdatePosting(this.id, this.body);
}

class ArchivePosting extends PostingsEvent {
  final String id;
  ArchivePosting(this.id);
}

class PostingsState {
  final bool isLoading;
  final bool isSubmitting;
  final bool isCreateSuccess;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final int currentPage;
  final List<Specialization>? specializations;
  final List<Vacancy>? vacancies;
  final EmployerStats? stats;
  final String? error;

  PostingsState({
    this.isLoading = false,
    this.isSubmitting = false,
    this.isCreateSuccess = false,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.specializations,
    this.vacancies,
    this.stats,
    this.error,
  });

  PostingsState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    bool? isCreateSuccess,
    bool? isLoadingMore,
    bool? hasReachedMax,
    int? currentPage,
    List<Specialization>? specializations,
    List<Vacancy>? vacancies,
    EmployerStats? stats,
    String? error,
  }) {
    return PostingsState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isCreateSuccess: isCreateSuccess ?? this.isCreateSuccess,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      specializations: specializations ?? this.specializations,
      vacancies: vacancies ?? this.vacancies,
      stats: stats ?? this.stats,
      error: error,
    );
  }
}

@injectable
class PostingsBloc extends Bloc<PostingsEvent, PostingsState> {
  final PostingsRepository _postingsRepository;

  PostingsBloc(this._postingsRepository) : super(PostingsState()) {
    on<LoadPostings>(_onLoad);
    on<LoadMorePostings>(_onLoadMore);
    on<CreatePosting>(_onCreate);
    on<UpdatePosting>(_onUpdate);
    on<ArchivePosting>(_onArchive);
  }

  Future<void> _onLoad(LoadPostings event, Emitter<PostingsState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, currentPage: 1, hasReachedMax: false));
    
    final result = await Future.wait([
      _postingsRepository.getVacancies(page: 1, limit: 10),
      _postingsRepository.getEmployerStats(),
      _postingsRepository.getSpecializations(),
    ]);

    final vacanciesResult = result[0] as Either<Failure, List<Vacancy>>;
    final statsResult = result[1] as Either<Failure, EmployerStats>;
    final specializationsResult = result[2] as Either<Failure, List<Specialization>>;

    final specializations = specializationsResult.fold((_) => <Specialization>[], (r) => r);

    vacanciesResult.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (vacancies) {
        final hasReachedMax = vacancies.length < 10;
        statsResult.fold(
          (failure) => emit(state.copyWith(isLoading: false, vacancies: vacancies, specializations: specializations, hasReachedMax: hasReachedMax)),
          (stats) => emit(state.copyWith(isLoading: false, vacancies: vacancies, stats: stats, specializations: specializations, hasReachedMax: hasReachedMax)),
        );
      },
    );
  }

  Future<void> _onLoadMore(LoadMorePostings event, Emitter<PostingsState> emit) async {
    if (state.hasReachedMax || state.isLoadingMore || state.isLoading) return;

    emit(state.copyWith(isLoadingMore: true));
    final nextPage = state.currentPage + 1;

    final result = await _postingsRepository.getVacancies(page: nextPage, limit: 10);

    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false, error: failure.message)),
      (newVacancies) {
        emit(state.copyWith(
          isLoadingMore: false,
          currentPage: nextPage,
          hasReachedMax: newVacancies.length < 10,
          vacancies: List.of(state.vacancies ?? [])..addAll(newVacancies),
        ));
      },
    );
  }

  Future<void> _onCreate(CreatePosting event, Emitter<PostingsState> emit) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final result = await _postingsRepository.createVacancy(event.body);
    result.fold(
      (failure) => emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (vacancy) {
        emit(state.copyWith(isSubmitting: false, isCreateSuccess: true));
        add(LoadPostings()); // refresh list
      },
    );
  }

  Future<void> _onUpdate(UpdatePosting event, Emitter<PostingsState> emit) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final result = await _postingsRepository.updateVacancy(event.id, event.body);
    result.fold(
      (failure) => emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (vacancy) {
        emit(state.copyWith(isSubmitting: false, isCreateSuccess: true));
        add(LoadPostings()); // refresh list
      },
    );
  }

  Future<void> _onArchive(ArchivePosting event, Emitter<PostingsState> emit) async {
    final result = await _postingsRepository.archiveVacancy(event.id);
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) => add(LoadPostings()),
    );
  }
}
