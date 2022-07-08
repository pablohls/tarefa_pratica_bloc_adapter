import 'dart:async';

import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/usecase/todo_usecase.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_event.dart';
import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/blocs/todo_state.dart';

import '../../domain/entities/todo_entitie.dart';

class TodoBloc {
  final List<Todo> _todos = [];
  final GetTodo _getTodo;

  TodoBloc(this._getTodo) {
    _inputTodoController.stream.listen(_mapEventToState);
  }

  final StreamController<TodoEvent> _inputTodoController =
      StreamController<TodoEvent>();

  final StreamController<TodoState> _outputTodoController =
      StreamController<TodoState>();

  Sink<TodoEvent> get inputTodo => _inputTodoController.sink;
  Stream<TodoState> get stream => _outputTodoController.stream;

  _mapEventToState(TodoEvent event) async {
    if (event is AddTodoEvent) {
      Todo todo = await _getTodo.call();
      _todos.add(todo);
    } else if (event is RemoveTodoEvent) {
      _todos.remove(event.todo);
    }

    _outputTodoController.add(TodoSuccessState(todos: _todos));
  }
}
