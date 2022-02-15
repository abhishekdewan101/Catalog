import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: SizedBox(
              width: screenSize.width,
              height: 300,
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
            padding: const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
            child: TextField(
              style: TextStyle(color: theme.colorScheme.onBackground),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.onBackground.withAlpha(20),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
            child: TextField(
              obscureText: true,
              obscuringCharacter: "*",
              style: TextStyle(color: theme.colorScheme.onBackground),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.onBackground.withAlpha(20),
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: ElevatedButton(
              onPressed: () {},
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
        ],
      ),
    );
  }
}
