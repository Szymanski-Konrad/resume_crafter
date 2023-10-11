//ignore_for_file: public_member_api_docs
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:resume_crafter/data/auth/repository/auth_repository.dart';
import 'package:resume_crafter/injection/injection.dart';
import 'package:resume_crafter/router/app_router.gr.dart';

// mock auth state
bool isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final authRepository = getIt<AuthRepository>();
    final user = await authRepository.getCurrentUser();
    log(user.toString());
    if (user != null) {
      // ignore: unawaited_futures
      router.push(
        const AuthRoute(
            // onLoginResult: (isLoggedIn) {
            //   isAuthenticated = isLoggedIn;
            //   // we can't pop the bottom page in the navigator's stack
            //   // so we just remove it from our local stack
            //   router
            //     ..markUrlStateForReplace()
            //     ..removeLast();
            //   resolver.next();
            // },
            ),
      );
    } else {
      resolver.next();
    }
  }
}
