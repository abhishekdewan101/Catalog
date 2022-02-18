import 'package:mind_palace/repositories/authentication_repository.dart';
import 'package:mind_palace/utils/extensions/string_extensions.dart';
import 'package:rxdart/subjects.dart';

enum SignUpViewState {
  INITIAL,
  SIGNING_UP,
  EMAIL_ERROR,
  PASSWORD_ERROR,
  PASSWORD_DOESNT_MATCH_ERROR,
  SIGN_UP_SUCCESSFUL,
}

abstract class SignUpViewModel {
  Stream<SignUpViewState> getViewStateStream();
  void tryCreateUserWithEmailAndPassword(
      String? email, String? password, String? passwordConfirmation);
}

class SignUpViewModelImpl implements SignUpViewModel {
  late AuthenticationRepository repository;
  final _viewState = BehaviorSubject.seeded(SignUpViewState.INITIAL);

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
    _viewState.value = SignUpViewState.SIGNING_UP;
    repository
        .tryCreateUserWithEmailAndPassword(email!, password!)
        .then(
            (value) => {_viewState.value = SignUpViewState.SIGN_UP_SUCCESSFUL})
        .catchError(
          (error, stackTrace) => {
            //TODO: Perhaps better handling of different errors to provide better error message.
            if (error.toString().contains('password'))
              _viewState.value = SignUpViewState.PASSWORD_ERROR
            else
              _viewState.value = SignUpViewState.EMAIL_ERROR
          },
        );
  }

  bool _isValidPassword(String? password, String? passwordConfirmation) {
    if (password == null ||
        password.isEmpty ||
        passwordConfirmation == null ||
        passwordConfirmation.isEmpty) {
      _viewState.value = SignUpViewState.PASSWORD_ERROR;
      return false;
    }

    if (password != passwordConfirmation) {
      _viewState.value = SignUpViewState.PASSWORD_DOESNT_MATCH_ERROR;
      return false;
    }
    return true;
  }

  bool _isValidEmail(String? email) {
    if (email == null || email.isEmpty || !email.isValidEmail()) {
      _viewState.value = SignUpViewState.EMAIL_ERROR;
      return false;
    }
    return true;
  }
}
