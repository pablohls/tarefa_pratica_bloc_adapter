import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/entities/todo_entitie.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {}

class RemoveTodoEvent extends TodoEvent {
  Todo todo;

  RemoveTodoEvent({required this.todo});
}
