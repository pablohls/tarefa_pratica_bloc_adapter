import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/datasource/remote_data_source.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/repository/todo_repository.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/usecase/todo_usecase.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_bloc.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_event.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_state.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/widgets/card_info.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TodoBloc(
        GetTodo(repository: TodoRepository(RemoteDataSource(client: Dio()))));
  }

  @override
  void dispose() {
    bloc.inputTodo.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.inputTodo.add(AddTodoEvent());
        },
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: StreamBuilder<TodoState>(
              stream: bloc.stream,
              builder: (context, AsyncSnapshot<TodoState> snapshot) {
                final todoList = snapshot.data?.todos ?? [];
                if (todoList.isEmpty) {
                  return const Center(
                    child: Text(
                      "Lista Vazia, Por favor pressione o botão abaixo para adicionar um item.",
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                if (todoList.isNotEmpty) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: todoList.length,
                      itemBuilder: ((context, index) => CardInfo(
                            todo: todoList[index],
                            bloc: bloc,
                          )));
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
