import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/vacancy_repository.dart';
import 'save_vacancy_usecase.dart';

@lazySingleton
class UnsaveVacancyUseCase implements UseCase<Unit, VacancyActionParams> {
  final VacancyRepository repository;

  UnsaveVacancyUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call([VacancyActionParams? params]) {
    assert(params != null);
    return repository.unsaveVacancy(params!.id);
  }
}
