import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  User? getCurrentUser();
  Future<UserCredential> tryCreateUserWithEmailAndPassword(
      String email, String password);
  Future<UserCredential?> trySignInUserWithEmailAndPassword(
      String email, String password);
}

class FirebaseAuthenticationService implements AuthenticationService {
  final FirebaseAuth instance;

  FirebaseAuthenticationService(this.instance);

  @override
  User? getCurrentUser() {
    return instance.currentUser;
  }

  @override
  Future<UserCredential> tryCreateUserWithEmailAndPassword(
      String email, String password) {
    return instance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential?> trySignInUserWithEmailAndPassword(
      String email, String password) {
    return instance.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
