import 'package:dart_mappable/dart_mappable.dart';
import 'package:mobile/core/enums/user_role.dart';

part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  final String? id;
  final UserRole? role;
  final bool isFromNamangan;

  const AuthState({
    this.id,
    this.role,
    this.isFromNamangan = false,
  });
}
