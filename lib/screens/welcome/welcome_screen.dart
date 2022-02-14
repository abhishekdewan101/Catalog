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

    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              context.goNamed(Routes.signUp);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: screenSize.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sign Up',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onBackground),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Material(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              context.goNamed(Routes.signUp);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: screenSize.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _buildButton(context),
              ),
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
      ),
    );
  }
}
