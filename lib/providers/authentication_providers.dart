import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_palace/repositories/authentication_repository.dart';
import 'package:mind_palace/services/authentication_service.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
    (_) => FirebaseAuthenticationService(FirebaseAuth.instance));

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
    (ref) => FirebaseAuthenticationRepository(
        ref.read(authenticationServiceProvider)));
