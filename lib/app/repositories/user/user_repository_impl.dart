// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/app/exceptions/auth_exception.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'email-already-in-use') {
        throw AuthException(
          message: 'E-mail já cadastrado, por favor faça login.',
        );
      } else if (e.code == 'weak-password') {
        throw AuthException(message: 'A senha digitada é muito fraca.');
      } else if (e.code == 'invalid-email') {
        throw AuthException(
          message: 'O formato do e-mail digitado é inválido.',
        );
      }

      throw AuthException(message: 'Erro ao registrar usuário: ${e.message}');
    } catch (e) {
      throw AuthException(message: 'Erro desconhecido ao registrar.');
    }
  }
}
