import 'package:mind_palace/repositories/authentication_repository.dart';
import 'package:mind_palace/utils/extensions/string_extensions.dart';
import 'package:rxdart/subjects.dart';

enum SignUpViewState {
  initial,
  signingUp,
  emailError,
  passwordError,
  passwordDoesNotMatchError,
  signUpSuccessful,
}

abstract class SignUpViewModel {
  Stream<SignUpViewState> getViewStateStream();
  void tryCreateUserWithEmailAndPassword(
      String? email, String? password, String? passwordConfirmation);
}

class SignUpViewModelImpl implements SignUpViewModel {
  late AuthenticationRepository repository;
  final _viewState = BehaviorSubject.seeded(SignUpViewState.initial);

  SignUpViewModelImpl(this.repository);

  @override
  Stream<SignUpViewState> getViewStateStream() {
    return _viewState;
  }

  @override
  void tryCreateUserWithEmailAndPassword(
      String? email, String? password, String? passwordConfirmation) {
    if (!_isValidEmail(email)) return;
    if (!_isValidPassword(password, passwordConfirmation)) return;
    _viewState.value = SignUpViewState.signingUp;
    repository
        .tryCreateUserWithEmailAndPassword(email!, password!)
        .then((value) => {_viewState.value = SignUpViewState.signUpSuccessful})
        .catchError(
          (error, stackTrace) => {
            //TODO: Perhaps better handling of different errors to provide better error message.
            if (error.toString().contains('password'))
              _viewState.value = SignUpViewState.passwordError
            else
              _viewState.value = SignUpViewState.emailError
          },
        );
  }

  bool _isValidPassword(String? password, String? passwordConfirmation) {
    if (password == null ||
        password.isEmpty ||
        passwordConfirmation == null ||
        passwordConfirmation.isEmpty) {
      _viewState.value = SignUpViewState.passwordError;
      return false;
    }

    if (password != passwordConfirmation) {
      _viewState.value = SignUpViewState.passwordDoesNotMatchError;
      return false;
    }
    return true;
  }

  bool _isValidEmail(String? email) {
    if (email == null || email.isEmpty || !email.isValidEmail()) {
      _viewState.value = SignUpViewState.emailError;
      return false;
    }
    return true;
  }
}
