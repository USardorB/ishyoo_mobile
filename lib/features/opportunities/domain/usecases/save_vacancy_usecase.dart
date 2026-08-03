import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/vacancy_repository.dart';

class VacancyActionParams {
  final String id;

  const VacancyActionParams(this.id);
}

@lazySingleton
class SaveVacancyUseCase implements UseCase<Unit, VacancyActionParams> {
  final VacancyRepository repository;

  SaveVacancyUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call([VacancyActionParams? params]) {
    assert(params != null);
    return repository.saveVacancy(params!.id);
  }
}
