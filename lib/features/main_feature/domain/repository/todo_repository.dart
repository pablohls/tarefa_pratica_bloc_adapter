import '../entities/todo_entitie.dart';

abstract class ITodoRepository {
  Future<Todo> getTodo();
}
