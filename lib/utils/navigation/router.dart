import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/screens/screens.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: "/",
    routes: [
      GoRoute(
          path: "/",
          name: Routes.splash,
          builder: (context, state) => SplashScreen())
    ],
  );
}
