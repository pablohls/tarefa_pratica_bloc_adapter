import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/repository/todo_repository.dart';

class GetTodo {
  final ITodoRepository repository;

  GetTodo({required this.repository});

  call() {
    return repository.getTodo();
  }
}
