import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/app/core/auth/auth_provider.dart';
import 'package:todo_list_app/app/core/ui/messages.dart';
import 'package:todo_list_app/app/core/ui/theme_extensions.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final nameVN = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        "https://avatars.githubusercontent.com/u/43018341?v=4";
                  },
                  builder: (_, value, _) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30,
                    );
                  },
                ),
                //CircleAvatar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      selector: (context, authProvider) {
                        return authProvider.user?.displayName ??
                            "Não informado";
                      },
                      builder: (_, value, _) {
                        return Text(value, style: context.textTheme.bodySmall);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Alterar nome"),
                    content: TextField(
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final nameValue = nameVN.value;
                          if (nameValue.isEmpty) {
                            Messages.of(context).showError("Nome obrigatório");
                          } else {
                            await context.read<UserService>().updateDisplayName(
                              nameValue,
                            );

                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("Alterar"),
                      ),
                    ],
                  );
                },
              );
            },
            title: Text("Alterar nome"),
          ),
          ListTile(
            onTap: () => context.read<AuthProvider>().logout(),
            title: Text("Sair"),
          ),
        ],
      ),
    );
  }
}
