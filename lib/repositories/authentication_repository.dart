import 'package:firebase_auth/firebase_auth.dart';
import 'package:mind_palace/services/authentication_service.dart';

abstract class AuthenticationRepository {
  User? getCurrentUser();
}

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final AuthenticationService instance;

  FirebaseAuthenticationRepository(this.instance);

  @override
  User? getCurrentUser() {
    return instance.getCurrentUser();
  }
}
