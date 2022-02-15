import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  Widget _buildButton(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var screenSize = MediaQuery.of(context).size;

    return Column(children: [
      OutlinedButton(
        onPressed: () {
          context.pushNamed(Routes.signIn);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: theme.colorScheme.primary),
          minimumSize: Size(screenSize.width, 60),
        ),
        child: const Text(
          'Sign In',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(Routes.signUp);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(screenSize.width, 60),
          ),
          child: const Text('Sign Up'),
        ),
      )
    ]);
  }

  Widget _buildWelcomeMessage(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome !",
          style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Catalog the different parts of your life and manage them from anywhere",
            style:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(122)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var brightness = MediaQuery.of(context).platformBrightness;
    ThemeData theme = Theme.of(context);
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWelcomeMessage(context),
            _buildButton(context),
            SvgPicture.asset(
              isDarkMode
                  ? 'assets/welcome_illus.svg'
                  : 'assets/welcome_illus_light.svg',
              width: 386,
              height: 328,
            )
          ],
        ),
      ),
    );
  }
}
