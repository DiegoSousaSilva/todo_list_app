import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/auth/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Colors.deepPurple.shade100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Home Page"),
              TextButton(
                onPressed: () {
                  context.read<AuthProvider>().logout();
                },
                child: Text('Sair'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
