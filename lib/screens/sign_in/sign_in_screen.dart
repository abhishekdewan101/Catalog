import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/providers/view_model_providers.dart';
import 'package:mind_palace/screens/sign_in/sign_in_view_model.dart';
import 'package:mind_palace/utils/navigation/routes.dart';
import 'package:mind_palace/widgets/text_field_with_error.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({Key? key}) : super(key: key);

  final emailTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    SignInViewModel viewModel = ref.read(signInViewModelProvider);

    return Scaffold(
      body: StreamBuilder(
        stream: viewModel.getViewStateStream(),
        builder: (context, snapshot) {
          log("Current State - ${snapshot.data}");

          if (snapshot.data == SignInViewState.signInSuccess) {
            Future.microtask(() => context.goNamed(Routes.home));
          }

          if (snapshot.data == SignInViewState.signInError) {
            Future.microtask(
              () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text(
                        "Could not sign in. Please check your credentials",
                        style: TextStyle(color: theme.colorScheme.onSurface)),
                  ),
                )
              },
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height / 4,
                    child: SvgPicture.asset(
                      'assets/landing_page_light.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Sign In",
                  style: theme.textTheme.headline4?.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                  child: TextFieldWithError(
                    textEditingController: emailTextFieldController,
                    errorText: "Check you credentials",
                    textStyle: TextStyle(color: theme.colorScheme.onBackground),
                    errorStyle: TextStyle(color: theme.colorScheme.error),
                    showError: (snapshot.hasData &&
                        snapshot.data == SignInViewState.signInError),
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(75),
                    ),
                    obsurceText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                  child: TextFieldWithError(
                    textEditingController: passwordTextFieldController,
                    errorText: "Check you credentials",
                    textStyle: TextStyle(color: theme.colorScheme.onBackground),
                    errorStyle: TextStyle(color: theme.colorScheme.error),
                    showError: (snapshot.hasData &&
                        snapshot.data == SignInViewState.signInError),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(75),
                    ),
                    obsurceText: true,
                  ),
                ),
                (snapshot.hasData && snapshot.data == SignInViewState.signingIn)
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.tryCreateUserWithEmailAndPassword(
                          emailTextFieldController.text,
                          passwordTextFieldController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenSize.width, 60),
                    ),
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                ),
                Text(
                  "----- Or -----",
                  style: TextStyle(
                    color: theme.colorScheme.onBackground.withAlpha(125),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(screenSize.width, 60),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/google_logo.svg',
                          width: 24,
                          height: 24,
                        ),
                        Container(
                          width: 10,
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account. ",
                      style: TextStyle(
                        color: theme.colorScheme.onBackground,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(Routes.signUp);
                            },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
