// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobile/core/configs/di/app_modules.dart' as _i385;
import 'package:mobile/core/configs/network/auth_interceptor.dart' as _i726;
import 'package:mobile/core/shared/services/token_service.dart' as _i910;
import 'package:mobile/features/applications/data/datasources/application_remote_data_source.dart'
    as _i1044;
import 'package:mobile/features/applications/data/repositories/application_repository_impl.dart'
    as _i495;
import 'package:mobile/features/applications/domain/repositories/application_repository.dart'
    as _i148;
import 'package:mobile/features/applications/domain/usecases/get_applications_usecase.dart'
    as _i319;
import 'package:mobile/features/applications/domain/usecases/update_application_status_usecase.dart'
    as _i974;
import 'package:mobile/features/applications/presentation/bloc/applications_bloc.dart'
    as _i458;
import 'package:mobile/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i996;
import 'package:mobile/features/auth/data/repositories/auth_repository_impl.dart'
    as _i950;
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart'
    as _i202;
import 'package:mobile/features/auth/domain/usecases/auth_usecases.dart'
    as _i316;
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart' as _i520;
import 'package:mobile/features/location/data/datasources/location_remote_data_source.dart'
    as _i917;
import 'package:mobile/features/location/data/repositories/location_repository_impl.dart'
    as _i247;
import 'package:mobile/features/location/domain/repositories/location_repository.dart'
    as _i651;
import 'package:mobile/features/location/domain/usecases/get_districts_use_case.dart'
    as _i677;
import 'package:mobile/features/location/domain/usecases/get_regions_use_case.dart'
    as _i737;
import 'package:mobile/features/notifications/data/datasources/notification_remote_data_source.dart'
    as _i906;
import 'package:mobile/features/notifications/data/repositories/notification_repository_impl.dart'
    as _i312;
import 'package:mobile/features/notifications/domain/repositories/notification_repository.dart'
    as _i224;
import 'package:mobile/features/notifications/domain/usecases/get_notification_detail_usecase.dart'
    as _i627;
import 'package:mobile/features/notifications/domain/usecases/get_notifications_usecase.dart'
    as _i900;
import 'package:mobile/features/notifications/domain/usecases/mark_all_notifications_as_read_usecase.dart'
    as _i397;
import 'package:mobile/features/notifications/presentation/bloc/notification_detail_bloc.dart'
    as _i656;
import 'package:mobile/features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i573;
import 'package:mobile/features/opportunities/data/datasources/vacancy_remote_data_source.dart'
    as _i970;
import 'package:mobile/features/opportunities/data/repositories/vacancy_repository_impl.dart'
    as _i547;
import 'package:mobile/features/opportunities/domain/repositories/vacancy_repository.dart'
    as _i111;
import 'package:mobile/features/opportunities/domain/usecases/apply_to_vacancy_usecase.dart'
    as _i1058;
import 'package:mobile/features/opportunities/domain/usecases/get_nearby_jobs_usecase.dart'
    as _i291;
import 'package:mobile/features/opportunities/domain/usecases/get_vacancy_detail_usecase.dart'
    as _i808;
import 'package:mobile/features/opportunities/domain/usecases/get_vacancy_feed_usecase.dart'
    as _i933;
import 'package:mobile/features/opportunities/domain/usecases/save_vacancy_usecase.dart'
    as _i301;
import 'package:mobile/features/opportunities/domain/usecases/unsave_vacancy_usecase.dart'
    as _i360;
import 'package:mobile/features/opportunities/presentation/bloc/nearby_jobs_bloc.dart'
    as _i557;
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_details_bloc.dart'
    as _i437;
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart'
    as _i328;
import 'package:mobile/features/profile/presentation/bloc/candidate_profile_bloc.dart'
    as _i410;
import 'package:mobile/features/resume/data/datasources/resume_remote_data_source.dart'
    as _i721;
import 'package:mobile/features/resume/data/repositories/resume_repository_impl.dart'
    as _i690;
import 'package:mobile/features/resume/domain/repositories/resume_repository.dart'
    as _i716;
import 'package:mobile/features/resume/domain/usecases/boost_resume_usecase.dart'
    as _i320;
import 'package:mobile/features/resume/domain/usecases/create_resume_usecase.dart'
    as _i1024;
import 'package:mobile/features/resume/domain/usecases/delete_resume_usecase.dart'
    as _i131;
import 'package:mobile/features/resume/domain/usecases/get_candidate_resumes_usecase.dart'
    as _i264;
import 'package:mobile/features/resume/domain/usecases/get_resume_detail_usecase.dart'
    as _i140;
import 'package:mobile/features/resume/domain/usecases/get_specializations_use_case.dart'
    as _i512;
import 'package:mobile/features/resume/domain/usecases/update_resume_usecase.dart'
    as _i907;
import 'package:mobile/features/resume/presentation/bloc/resume_detail_bloc.dart'
    as _i865;
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart'
    as _i1043;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => networkModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i910.TokenService>(
      () => _i910.TokenService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i933.GetVacancyFeedParams>(
      () => _i933.GetVacancyFeedParams(
        limit: gh<int>(),
        specialization: gh<String>(),
        jobType: gh<String>(),
        experienceLevel: gh<String>(),
        title: gh<String>(),
      ),
    );
    gh.factory<_i726.AuthInterceptor>(
      () => _i726.AuthInterceptor(gh<_i910.TokenService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i726.AuthInterceptor>()),
    );
    gh.lazySingleton<_i1044.ApplicationRemoteDataSource>(
      () => _i1044.ApplicationRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i996.AuthRemoteDataSource>(
      () => _i996.AuthRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i917.LocationRemoteDataSource>(
      () => _i917.LocationRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i906.NotificationRemoteDataSource>(
      () => _i906.NotificationRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i970.VacancyRemoteDataSource>(
      () => _i970.VacancyRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i721.ResumeRemoteDataSource>(
      () => _i721.ResumeRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i148.ApplicationRepository>(
      () => _i495.ApplicationRepositoryImpl(
        gh<_i1044.ApplicationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i111.VacancyRepository>(
      () => _i547.VacancyRepositoryImpl(gh<_i970.VacancyRemoteDataSource>()),
    );
    gh.lazySingleton<_i224.NotificationRepository>(
      () => _i312.NotificationRepositoryImpl(
        gh<_i906.NotificationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i716.ResumeRepository>(
      () => _i690.ResumeRepositoryImpl(gh<_i721.ResumeRemoteDataSource>()),
    );
    gh.lazySingleton<_i319.GetApplicationsUseCase>(
      () => _i319.GetApplicationsUseCase(gh<_i148.ApplicationRepository>()),
    );
    gh.lazySingleton<_i974.UpdateApplicationStatusUseCase>(
      () => _i974.UpdateApplicationStatusUseCase(
        gh<_i148.ApplicationRepository>(),
      ),
    );
    gh.lazySingleton<_i202.AuthRepository>(
      () => _i950.AuthRepositoryImpl(gh<_i996.AuthRemoteDataSource>()),
    );
    gh.factory<_i458.ApplicationsBloc>(
      () => _i458.ApplicationsBloc(
        gh<_i319.GetApplicationsUseCase>(),
        gh<_i974.UpdateApplicationStatusUseCase>(),
      ),
    );
    gh.lazySingleton<_i1058.ApplyToVacancyUseCase>(
      () => _i1058.ApplyToVacancyUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i291.GetNearbyJobsUseCase>(
      () => _i291.GetNearbyJobsUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i808.GetVacancyDetailUseCase>(
      () => _i808.GetVacancyDetailUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i933.GetVacancyFeedUseCase>(
      () => _i933.GetVacancyFeedUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i301.SaveVacancyUseCase>(
      () => _i301.SaveVacancyUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i360.UnsaveVacancyUseCase>(
      () => _i360.UnsaveVacancyUseCase(gh<_i111.VacancyRepository>()),
    );
    gh.lazySingleton<_i320.BoostResumeUseCase>(
      () => _i320.BoostResumeUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i1024.CreateResumeUseCase>(
      () => _i1024.CreateResumeUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i131.DeleteResumeUseCase>(
      () => _i131.DeleteResumeUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i264.GetCandidateResumesUseCase>(
      () => _i264.GetCandidateResumesUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i140.GetResumeDetailUseCase>(
      () => _i140.GetResumeDetailUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i512.GetSpecializationsUseCase>(
      () => _i512.GetSpecializationsUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i907.UpdateResumeUseCase>(
      () => _i907.UpdateResumeUseCase(gh<_i716.ResumeRepository>()),
    );
    gh.lazySingleton<_i651.LocationRepository>(
      () => _i247.LocationRepositoryImpl(gh<_i917.LocationRemoteDataSource>()),
    );
    gh.factory<_i410.CandidateProfileBloc>(
      () => _i410.CandidateProfileBloc(gh<_i264.GetCandidateResumesUseCase>()),
    );
    gh.factory<_i557.NearbyJobsBloc>(
      () => _i557.NearbyJobsBloc(gh<_i291.GetNearbyJobsUseCase>()),
    );
    gh.factory<_i328.VacancyFeedBloc>(
      () => _i328.VacancyFeedBloc(
        getVacancyFeedUseCase: gh<_i933.GetVacancyFeedUseCase>(),
      ),
    );
    gh.lazySingleton<_i627.GetNotificationDetailUseCase>(
      () => _i627.GetNotificationDetailUseCase(
        gh<_i224.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i900.GetNotificationsUseCase>(
      () => _i900.GetNotificationsUseCase(gh<_i224.NotificationRepository>()),
    );
    gh.lazySingleton<_i397.MarkAllNotificationsAsReadUseCase>(
      () => _i397.MarkAllNotificationsAsReadUseCase(
        gh<_i224.NotificationRepository>(),
      ),
    );
    gh.factory<_i573.NotificationsBloc>(
      () => _i573.NotificationsBloc(
        gh<_i900.GetNotificationsUseCase>(),
        gh<_i397.MarkAllNotificationsAsReadUseCase>(),
      ),
    );
    gh.factory<_i316.RequestSmsUseCase>(
      () => _i316.RequestSmsUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.RegisterUseCase>(
      () => _i316.RegisterUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.VerifyUseCase>(
      () => _i316.VerifyUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.LoginUseCase>(
      () => _i316.LoginUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.GetMeUseCase>(
      () => _i316.GetMeUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.RefreshTokenUseCase>(
      () => _i316.RefreshTokenUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i316.LogoutUseCase>(
      () => _i316.LogoutUseCase(gh<_i202.AuthRepository>()),
    );
    gh.factory<_i437.VacancyDetailsBloc>(
      () => _i437.VacancyDetailsBloc(
        gh<_i808.GetVacancyDetailUseCase>(),
        gh<_i1058.ApplyToVacancyUseCase>(),
        gh<_i301.SaveVacancyUseCase>(),
        gh<_i360.UnsaveVacancyUseCase>(),
      ),
    );
    gh.factory<_i865.ResumeDetailBloc>(
      () => _i865.ResumeDetailBloc(gh<_i140.GetResumeDetailUseCase>()),
    );
    gh.factory<_i1043.ResumeFormBloc>(
      () => _i1043.ResumeFormBloc(
        gh<_i1024.CreateResumeUseCase>(),
        gh<_i907.UpdateResumeUseCase>(),
      ),
    );
    gh.factory<_i656.NotificationDetailBloc>(
      () => _i656.NotificationDetailBloc(
        gh<_i627.GetNotificationDetailUseCase>(),
      ),
    );
    gh.lazySingleton<_i677.GetDistrictsUseCase>(
      () => _i677.GetDistrictsUseCase(gh<_i651.LocationRepository>()),
    );
    gh.lazySingleton<_i737.GetRegionsUseCase>(
      () => _i737.GetRegionsUseCase(gh<_i651.LocationRepository>()),
    );
    gh.factory<_i520.AuthBloc>(
      () => _i520.AuthBloc(
        gh<_i316.RequestSmsUseCase>(),
        gh<_i316.RegisterUseCase>(),
        gh<_i316.VerifyUseCase>(),
        gh<_i316.LoginUseCase>(),
        gh<_i316.GetMeUseCase>(),
        gh<_i316.LogoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i385.NetworkModule {}
