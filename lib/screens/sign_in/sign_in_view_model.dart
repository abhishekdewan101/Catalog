import 'dart:developer';

import 'package:mind_palace/repositories/authentication_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mind_palace/utils/extensions/string_extensions.dart';

abstract class SignInViewModel {
  Stream<SignInViewState> getViewStateStream();
  void tryCreateUserWithEmailAndPassword(String? email, String? password);
}

enum SignInViewState {
  INITIAL,
  SIGNING_IN,
  EMAIL_ERROR,
  PASSWORD_ERROR,
  SIGN_IN_SUCCESS
}

class SignInViewModelImpl implements SignInViewModel {
  late AuthenticationRepository repository;
  final _viewState =
      BehaviorSubject<SignInViewState>.seeded(SignInViewState.INITIAL);

  SignInViewModelImpl(this.repository);

  @override
  Stream<SignInViewState> getViewStateStream() {
    return _viewState;
  }

  @override
  void tryCreateUserWithEmailAndPassword(String? email, String? password) {
    if (!_isValidEmail(email)) return;
    if (!_isValidPassword(password)) return;
    _viewState.value = SignInViewState.SIGNING_IN;
    repository
        .tryCreateUserWithEmailAndPassword(email!, password!)
        .then((value) => {_viewState.value = SignInViewState.SIGN_IN_SUCCESS})
        .catchError(
          (error, stackTrace) => {
            if (error.toString().contains('password'))
              _viewState.value = SignInViewState.PASSWORD_ERROR
            else
              _viewState.value = SignInViewState.EMAIL_ERROR
          },
        );
  }

  bool _isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      _viewState.value = SignInViewState.PASSWORD_ERROR;
      return false;
    }
    return true;
  }

  bool _isValidEmail(String? email) {
    if (email == null || email.isEmpty || !email.isValidEmail()) {
      _viewState.value = SignInViewState.EMAIL_ERROR;
      return false;
    }
    return true;
  }
}
