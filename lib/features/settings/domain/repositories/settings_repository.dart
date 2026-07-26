import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/user_settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserSettings>> getCandidateSettings();
  Future<Either<Failure, NotificationSettings>> updateCandidateSettings(
    Map<String, dynamic> body,
  );
}
