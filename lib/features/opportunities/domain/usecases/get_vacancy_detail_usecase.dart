import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/vacancy.dart';
import '../repositories/vacancy_repository.dart';

class GetVacancyDetailParams {
  final String id;

  const GetVacancyDetailParams(this.id);
}

@lazySingleton
class GetVacancyDetailUseCase implements UseCase<Vacancy, GetVacancyDetailParams> {
  final VacancyRepository repository;

  GetVacancyDetailUseCase(this.repository);

  @override
  Future<Either<Failure, Vacancy>> call([GetVacancyDetailParams? params]) {
    assert(params != null);
    return repository.getVacancyDetail(params!.id);
  }
}
