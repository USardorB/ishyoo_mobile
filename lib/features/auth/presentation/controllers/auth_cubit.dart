import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/presentation/controllers/auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void changeUserRole(UserRole role) {
    emit(state.copyWith(role: role));
  }
}
