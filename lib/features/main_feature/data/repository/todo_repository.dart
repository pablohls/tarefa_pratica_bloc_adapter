import 'package:tarefa_pratica_bloc_adapter/features/main_feature/data/datasource/remote_data_source.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/repository/todo_repository.dart';

class TodoRepository implements ITodoRepository {
  final RemoteDataSource remoteDataSource;

  TodoRepository(this.remoteDataSource);

  @override
  Future getTodo() async {
    try {
      final todoAdapter = await remoteDataSource.getPost();
      return todoAdapter.toEntity();
    } catch (e) {
      print("Alguma coisa de errado não está certa");
    }
  }
}
