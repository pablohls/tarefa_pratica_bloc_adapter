import 'package:dio/dio.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/adapter/todo_adapter.dart';
import 'package:tarefa_pratica_bloc_adapter/utils/constant.dart';

class RemoteDataSource {
  final Dio client;
  RemoteDataSource({required this.client});

  int contador = 1;

  Future<TodoAdapter> getPost() async {
    var response = await client.get("$apiUrl/${contador.toString()}");
    TodoAdapter todoAdapter = TodoAdapter.fromJson(response.data);
    contador++;
    return todoAdapter;
  }
}
