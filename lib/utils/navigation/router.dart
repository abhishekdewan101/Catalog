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
        name: Routes.base,
        builder: (context, state) => const BaseScreen(),
      ),
      GoRoute(
        path: "/landing",
        name: Routes.landing,
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: "/signup",
        name: Routes.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: "/signin",
        name: Routes.signIn,
        builder: (context, state) => SignInScreen(),
      ),
    ],
  );
}
