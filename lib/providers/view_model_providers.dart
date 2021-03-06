import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_palace/providers/authentication_providers.dart';
import 'package:mind_palace/screens/account/account_view_model.dart';
import 'package:mind_palace/screens/sign_in/sign_in_view_model.dart';
import 'package:mind_palace/screens/sign_up/sign_up_view_model.dart';

final signInViewModelProvider = Provider.autoDispose<SignInViewModel>(
  (ref) => SignInViewModelImpl(ref.read(authenticationRepositoryProvider)),
);

final signUpViewModelProvider = Provider.autoDispose<SignUpViewModel>(
  (ref) => SignUpViewModelImpl(ref.read(authenticationRepositoryProvider)),
);

final accountViewModelProvider = Provider.autoDispose<AccountViewModel>(
  (ref) => AccountViewModelImpl(ref.read(authenticationRepositoryProvider)),
);
