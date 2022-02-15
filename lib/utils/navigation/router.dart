import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/screens/landing/landing_screen.dart';
import 'package:mind_palace/screens/screens.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.landing,
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: "/welcome",
        name: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: "/signup",
        name: Routes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: "/signin",
        name: Routes.signIn,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: "/base",
        name: Routes.base,
        builder: (context, state) => const BaseScreen(),
      )
    ],
  );
}
