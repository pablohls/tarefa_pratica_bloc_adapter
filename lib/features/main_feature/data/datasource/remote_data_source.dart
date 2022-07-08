import 'package:dio/dio.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/adapter/todo_adapter.dart';
import 'package:tarefa_pratica_bloc_adapter/utils/constant.dart';

class RemoteDataSource {
  final Dio client;

  RemoteDataSource({required this.client});

  Future<TodoAdapter> getPost() async {
    var response = await client.get("$apiUrl/1");
    TodoAdapter todoAdapter = TodoAdapter.fromJson(response.data);
    return todoAdapter;
  }
}
