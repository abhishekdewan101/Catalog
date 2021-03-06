import 'package:firebase_auth/firebase_auth.dart';
import 'package:mind_palace/services/authentication_service.dart';

abstract class AuthenticationRepository {
  User? getCurrentUser();
  Future<UserCredential> tryCreateUserWithEmailAndPassword(
      String email, String password);
  Future<UserCredential?> trySignInUserWithEmailAndPassword(
      String email, String password);
  Future<void> signOutUser();
}

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final AuthenticationService instance;

  FirebaseAuthenticationRepository(this.instance);

  @override
  User? getCurrentUser() {
    return instance.getCurrentUser();
  }

  @override
  Future<UserCredential> tryCreateUserWithEmailAndPassword(
      String email, String password) {
    return instance.tryCreateUserWithEmailAndPassword(email, password);
  }

  @override
  Future<UserCredential?> trySignInUserWithEmailAndPassword(
      String email, String password) {
    return instance.trySignInUserWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOutUser() {
    return instance.signOutUser();
  }
}
