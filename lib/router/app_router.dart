import 'package:auto_route/auto_route.dart';
import 'package:resume_crafter/router/app_router.gr.dart';
import 'package:resume_crafter/router/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: CreateResumeRoute.page),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
