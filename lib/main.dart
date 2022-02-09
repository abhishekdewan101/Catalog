import 'package:flutter/material.dart';
import 'package:mind_palace/utils/navigation/router.dart';
import 'package:mind_palace/utils/theme/mind_palace_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MindPalaceTheme.lightThemeData,
      darkTheme: MindPalaceTheme.darkThemeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
