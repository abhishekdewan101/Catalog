import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  User? getCurrentUser();
}

class FirebaseAuthenticationService implements AuthenticationService {
  final FirebaseAuth instance;

  FirebaseAuthenticationService(this.instance);

  @override
  User? getCurrentUser() {
    return instance.currentUser;
  }
}
