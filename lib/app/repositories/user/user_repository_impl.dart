// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? "Erro ao realizar login!");
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == "wrong-password") {
        throw AuthException(message: "Login ou senha inválidos!");
      }
      if (e.code == "invalid-credential") {
        throw AuthException(message: "Login ou senha inválidos!");
      }
      throw AuthException(message: e.message ?? "Erro ao realizar login!");
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == 'no-such-provider' || e.code == 'invalid-provider') {
        throw AuthException(
          message:
              "Esta conta foi criada com o Google. Faça login clicando no botão do Google",
        );
      }

      switch (e.code) {
        case 'user-not-found':
          throw AuthException(
            message: "Este e-mail não esta cadastrado no aplicativo.",
          );
        case 'invalid-email':
          throw AuthException(
            message: "O formato de e-mail digitado é inválido.",
          );
        case 'network-request-failed':
          throw AuthException(
            message: "Erro de conexão! Verifique sua internet.",
          );
        default:
          throw AuthException(message: "Erro ao resetar senha: ${e.message}");
      }
    } catch (e) {
      throw AuthException(
        message: "Erro inesperado ao tentar recuperar senha!",
      );
    }
  }

  @override
  Future<User?> googleLogin() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final googleUser = await googleSignIn.authenticate();

      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final firebaseCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: null,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        firebaseCredential,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(
          message:
              'Este e-mail já está associado a uma conta com senha. '
              'Por favor, faça o login tradicional usando seu e-mail e senha.',
        );
      }

      throw AuthException(
        message: 'Erro ao autenticar com o Google: ${e.message}',
      );
    } catch (e) {
      throw AuthException(
        message: 'Erro inesperado ao tentar fazer login com o Google.',
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      _firebaseAuth.signOut();
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      await googleSignIn.signOut();
    } on AuthException catch (e) {
      throw AuthException(message: "Erro ao tetar fazer logout do aplicativo!");
    }
  }
}
