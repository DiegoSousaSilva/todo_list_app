import 'package:flutter/material.dart';
import 'package:todo_list_app/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo List App', home: SplashPage());
  }
}
