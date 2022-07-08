import 'package:flutter/material.dart';

import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/entities/todo_entitie.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_bloc.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_event.dart';

class CardInfo extends StatelessWidget {
  final Todo todo;
  final TodoBloc bloc;
  const CardInfo({Key? key, required this.todo, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        elevation: 10,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Item ID: ${todo.id.toString()}"),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      bloc.inputTodo.add(RemoveTodoEvent(todo: todo));
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: todo.title.toString()),
                TextSpan(text: todo.body.toString())
              ])),
            )
          ],
        ),
      ),
    );
  }
}
