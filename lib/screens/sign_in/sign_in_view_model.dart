import 'package:mind_palace/repositories/authentication_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mind_palace/utils/extensions/string_extensions.dart';

abstract class SignInViewModel {
  Stream<SignInViewState> getViewStateStream();
  void tryCreateUserWithEmailAndPassword(String? email, String? password);
}

enum SignInViewState { initial, signingIn, signInError, signInSuccess }

class SignInViewModelImpl implements SignInViewModel {
  late AuthenticationRepository repository;
  final _viewState =
      BehaviorSubject<SignInViewState>.seeded(SignInViewState.initial);

  SignInViewModelImpl(this.repository);

  @override
  Stream<SignInViewState> getViewStateStream() {
    return _viewState;
  }

  @override
  void tryCreateUserWithEmailAndPassword(String? email, String? password) {
    if (!_isValidEmail(email)) return;
    if (!_isValidPassword(password)) return;
    _viewState.value = SignInViewState.signingIn;
    repository
        .trySignInUserWithEmailAndPassword(email!, password!)
        .then((value) => {_viewState.value = SignInViewState.signInSuccess})
        .catchError((error, stackTrace) =>
            {_viewState.value = SignInViewState.signInError});
  }

  bool _isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      _viewState.value = SignInViewState.signInError;
      return false;
    }
    return true;
  }

  bool _isValidEmail(String? email) {
    if (email == null || email.isEmpty || !email.isValidEmail()) {
      _viewState.value = SignInViewState.signInError;
      return false;
    }
    return true;
  }
}
