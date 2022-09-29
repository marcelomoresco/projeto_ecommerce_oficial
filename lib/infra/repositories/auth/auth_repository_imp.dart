import 'package:e_commerce_project_new/infra/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends IBaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      return user;
    } catch (_) {}
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  @override
  Stream<User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
