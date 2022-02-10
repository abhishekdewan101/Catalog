import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 75.0),
              child: Text(
                "Mind",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.psychology_outlined,
              size: 48,
              color: Theme.of(context).textTheme.displaySmall?.color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75.0),
              child: Text(
                "Palace",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
