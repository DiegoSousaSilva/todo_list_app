import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/app_widget.dart';
import 'package:todo_list_app/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_app/app/repositories/user/user_repository.dart';
import 'package:todo_list_app/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';
import 'package:todo_list_app/app/services/user/user_service_impl.dart';
import 'package:todo_list_app/app/core/auth/auth_provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => fAuth.FirebaseAuth.instance),
        Provider(create: (_) => SqliteConnectionFactory(), lazy: false),

        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            firebaseAuth: context.read<fAuth.FirebaseAuth>(),
          ),
        ),
        Provider<UserService>(
          create: (context) =>
              UserServiceImpl(userRepository: context.read<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            firebaseAuth: context.read<fAuth.FirebaseAuth>(),
            userService: context.read<UserService>(),
          )..loadListener(),
          lazy:
              false, // 🔥 O '..' tem que ficar aqui, no final da criação do AuthProvider!
        ),
      ],
      child: AppWidget(),
    );
  }
}
