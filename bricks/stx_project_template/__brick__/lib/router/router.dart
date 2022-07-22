import 'package:auto_route/auto_route.dart';

import 'package:{{project_name}}/screens/index.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: AuthScreen,
      children: [
        AutoRoute(
          page: LoginScreen,
        ),
        AutoRoute(
          page: HomeScreen,
          children: [
            dashboardRouter,
            profileRouter,
            settingsRouter,
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
