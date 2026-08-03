import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/services/token_service.dart';
import 'package:mobile/core/themes/app_colors.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          final tokenService = sl<TokenService>();
          final did = tokenService.getDid();
          if (did != null && did.isNotEmpty) {
            final roleStr = tokenService.getRole() ?? 'candidate';
            final role = roleStr == 'employer'
                ? UserRole.employer
                : UserRole.job_seeker;

            context.read<AuthBloc>().add(AuthRoleChanged(role));
            context.read<AuthBloc>().add(AuthGetMeRequested(roleStr));
          } else {
            context.router.replace(const ChooseLanguageRoute());
          }
        }
      });
      return null;
    }, []);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.router.replace(const MainLayoutRoute());
        } else if (state.status == AuthStatus.waitlisted) {
          context.router.replace(const WaitlistedRoute());
        } else if (state.status == AuthStatus.unauthenticated ||
            state.status == AuthStatus.failure) {
          final role = state.userRole ?? UserRole.job_seeker;
          context.router.replace(LoginRoute(role: role));
        }
      },
      child: Scaffold(
        backgroundColor: appLightColors.brandDefault,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(AppAssets.logo),
            ),
          ],
        ),
      ),
    );
  }
}
