import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({Key? key}) : super(key: key);

  Widget _buildAppLogo(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Text("Catalog",
            style: theme.textTheme.displaySmall?.copyWith(
                color: theme.colorScheme.onBackground,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Icon(
            Icons.style_outlined,
            size: 64,
            color: theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    ThemeData theme = Theme.of(context);

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
              width: 250,
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
              width: 250,
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              _buildAppLogo(context),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _buildButton(context)),
            ],
          ),
        ),
      ),
    );
  }
}
