import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/modules/todo_list_module.dart';
import 'package:todo_list_app/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_app/app/modules/auth/login/login_page.dart';
import 'package:todo_list_app/app/modules/auth/register/register_controller.dart';
import 'package:todo_list_app/app/modules/auth/register/register_page.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class AuthModule extends TodoListModule {
  AuthModule()
    : super(
        routers: {
          '/login': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
        },
        bindings: [
          ChangeNotifierProvider(
            create: (context) =>
                LoginController(userService: context.read<UserService>()),
          ),
          ChangeNotifierProvider(
            create: (context) =>
                RegisterController(userService: context.read<UserService>()),
          ),
        ],
      );
}
