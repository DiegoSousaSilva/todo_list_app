import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/app/core/ui/theme_extensions.dart';
import 'package:todo_list_app/app/modules/home/widgets/todo_card_filter.dart';

class HomeFilters extends StatefulWidget {
  const HomeFilters({super.key});

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Filtros", style: context.titleStyle),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(label: 'Hoje', tasks: 10, progress: .4),
              TodoCardFilter(label: 'Amanhã', tasks: 5, progress: .2),

              TodoCardFilter(label: 'Semana', tasks: 18, progress: .7),
            ],
          ),
        ),
      ],
    );
  }
}
