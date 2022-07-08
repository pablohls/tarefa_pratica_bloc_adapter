import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/datasource/remote_data_source.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/repository/todo_repository.dart';

import '../../domain/entities/todo_entitie.dart';

class TodoRepository implements ITodoRepository {
  final RemoteDataSource remoteDataSource;

  TodoRepository(this.remoteDataSource);

  @override
  Future<Todo> getTodo() async {
    try {
      final todoAdapter = await remoteDataSource.getPost();
      return todoAdapter.toEntity();
    } catch (e) {
      // ignore: use_rethrow_when_possible
      return throw (e);
    }
  }
}
