//ignore_for_file: public_member_api_docs
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:resume_crafter/router/app_router.gr.dart';

// mock auth state
bool isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthenticated) {
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

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
