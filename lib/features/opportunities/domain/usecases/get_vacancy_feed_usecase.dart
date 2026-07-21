import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/vacancy.dart';
import '../repositories/vacancy_repository.dart';

@lazySingleton
class GetVacancyFeedParams {
  final int? limit;
  final String? specialization;
  final String? jobType;
  final String? experienceLevel;
  final String? title;

  GetVacancyFeedParams({
    this.limit,
    this.specialization,
    this.jobType,
    this.experienceLevel,
    this.title,
  });
}

@lazySingleton
class GetVacancyFeedUseCase
    implements UseCase<List<Vacancy>, GetVacancyFeedParams> {
  final VacancyRepository repository;

  GetVacancyFeedUseCase(this.repository);

  @override
  Future<Either<Failure, List<Vacancy>>> call([GetVacancyFeedParams? params]) {
    return repository.getVacancyFeed(
      limit: params?.limit,
      specialization: params?.specialization,
      jobType: params?.jobType,
      experienceLevel: params?.experienceLevel,
      title: params?.title,
    );
  }
}
