import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_palace/providers/authentication_providers.dart';
import 'package:mind_palace/screens/screens.dart';

/*
 * This class doesn't show any screen. It's here to allow us to navigate to the right page
 * based on if the user is logged in vs not.
 */
class BaseScreen extends ConsumerWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.read(authenticationRepositoryProvider).getCurrentUser();
    if (user == null) {
      return const LandingScreen();
    } else {
      return const HomeScreen();
    }
  }
}
