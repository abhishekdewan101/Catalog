import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../../repositories/authentication_repository.dart';

abstract class AccountViewModel {
  void logoutUser();
  Stream<AccountViewState> getViewState();
  User? getCurrentUser();
}

enum AccountViewState { signOutSuccessful, signOutFailed }

class AccountViewModelImpl implements AccountViewModel {
  late AuthenticationRepository repository;
  final _viewState = BehaviorSubject<AccountViewState>();

  AccountViewModelImpl(this.repository);

  @override
  User? getCurrentUser() {
    return repository.getCurrentUser();
  }

  @override
  void logoutUser() {
    repository
        .signOutUser()
        .then(
          (value) => {_viewState.value = AccountViewState.signOutSuccessful},
        )
        .onError(
          (error, stackTrace) =>
              {_viewState.value = AccountViewState.signOutFailed},
        );
  }

  @override
  Stream<AccountViewState> getViewState() {
    return _viewState.stream;
  }
}
