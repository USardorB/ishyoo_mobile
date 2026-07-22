import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_remote_data_source.dart';
import '../models/user_settings.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserSettings>> getCandidateSettings() {
    return remoteDataSource.getCandidateSettings().asEither();
  }

  @override
  Future<Either<Failure, NotificationSettings>> updateCandidateSettings(Map<String, dynamic> body) {
    return remoteDataSource.updateCandidateSettings(body).asEither();
  }
}
