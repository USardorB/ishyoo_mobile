import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/vacancy_repository.dart';
import '../../../data/models/organization.dart';

part 'company_details_event.dart';
part 'company_details_state.dart';

@injectable
class CompanyDetailsBloc extends Bloc<CompanyDetailsEvent, CompanyDetailsState> {
  final VacancyRepository _repository;

  CompanyDetailsBloc(this._repository) : super(const CompanyDetailsState()) {
    on<LoadCompanyDetails>(_onLoadDetails);
  }

  Future<void> _onLoadDetails(
    LoadCompanyDetails event,
    Emitter<CompanyDetailsState> emit,
  ) async {
    emit(state.copyWith(status: CompanyDetailsStatus.loading));
    final result = await _repository.getOrganizationDetail(event.id);
    result.fold(
      (failure) => emit(state.copyWith(
        status: CompanyDetailsStatus.error,
        errorMessage: failure.message,
      )),
      (organization) => emit(state.copyWith(
        status: CompanyDetailsStatus.loaded,
        organization: organization,
      )),
    );
  }
}
