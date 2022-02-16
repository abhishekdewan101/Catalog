import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/providers/view_model_providers.dart';
import 'package:mind_palace/screens/sign_up/sign_up_view_model.dart';

import '../../utils/navigation/routes.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final passwordConfirmationTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    SignUpViewModel viewModel = ref.read(signUpViewModelProvider);

    return Scaffold(
      body: StreamBuilder(
        stream: viewModel.getViewStateStream(),
        builder: (context, snapshot) {
          log("Current State - ${snapshot.data}");

          if (snapshot.data == SignUpViewState.SIGN_UP_SUCCESSFUL) {
            Future.microtask(() => context.goNamed(Routes.home));
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
                  "Sign Up",
                  style: theme.textTheme.headline4?.copyWith(
                      color: theme.colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: emailTextFieldController,
                        style: TextStyle(color: theme.colorScheme.onBackground),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              theme.colorScheme.onBackground.withAlpha(20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                            color: theme.colorScheme.onBackground.withAlpha(75),
                          ),
                        ),
                      ),
                      (snapshot.hasData &&
                              snapshot.data == SignUpViewState.EMAIL_ERROR)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Error in email",
                                style:
                                    TextStyle(color: theme.colorScheme.error),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: passwordTextFieldController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        style: TextStyle(color: theme.colorScheme.onBackground),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              theme.colorScheme.onBackground.withAlpha(20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                            color: theme.colorScheme.onBackground.withAlpha(75),
                          ),
                        ),
                      ),
                      (snapshot.hasData &&
                              snapshot.data == SignUpViewState.PASSWORD_ERROR)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Error in password",
                                style:
                                    TextStyle(color: theme.colorScheme.error),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: passwordConfirmationTextFieldController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        style: TextStyle(color: theme.colorScheme.onBackground),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              theme.colorScheme.onBackground.withAlpha(20),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: theme.colorScheme.onBackground.withAlpha(75),
                          ),
                        ),
                      ),
                      (snapshot.hasData &&
                              snapshot.data ==
                                  SignUpViewState.PASSWORD_DOESNT_MATCH_ERROR)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Passwords do not match",
                                style:
                                    TextStyle(color: theme.colorScheme.error),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                (snapshot.hasData &&
                        snapshot.data == SignUpViewState.SIGNING_UP)
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
                          passwordTextFieldController.text,
                          passwordConfirmationTextFieldController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenSize.width, 60),
                    ),
                    child: const Text(
                      'Sign Up',
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
                          'Sign up with Google',
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
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: theme.colorScheme.onBackground,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed(Routes.signIn);
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
