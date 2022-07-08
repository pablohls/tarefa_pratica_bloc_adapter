import '../../domain/entities/todo_entitie.dart';

abstract class TodoState {
  List<Todo> todos;

  TodoState({
    required this.todos,
  });
}

class TodoInitialState extends TodoState {
  TodoInitialState() : super(todos: []);
}

class TodoSuccessState extends TodoState {
  TodoSuccessState({required List<Todo> todos}) : super(todos: todos);
}
