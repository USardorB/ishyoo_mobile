import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/application_response.dart';
import '../repositories/vacancy_repository.dart';

class ApplyToVacancyParams {
  final String id;
  final Map<String, dynamic> request;

  const ApplyToVacancyParams({required this.id, required this.request});
}

@lazySingleton
class ApplyToVacancyUseCase implements UseCase<ApplicationResponse, ApplyToVacancyParams> {
  final VacancyRepository repository;

  ApplyToVacancyUseCase(this.repository);

  @override
  Future<Either<Failure, ApplicationResponse>> call([ApplyToVacancyParams? params]) {
    assert(params != null);
    return repository.applyToVacancy(params!.id, params.request);
  }
}
