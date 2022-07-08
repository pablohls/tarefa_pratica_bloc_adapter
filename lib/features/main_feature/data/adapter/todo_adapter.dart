import 'package:tarefa_pratica_bloc_adapter/features/main_feature/domain/entities/todo_entitie.dart';

class TodoAdapter {
  final int userId;
  final int id;
  final String title;
  final String body;

  TodoAdapter(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory TodoAdapter.fromJson(Map<String, dynamic> json) {
    return TodoAdapter(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Todo toEntity() => Todo(userId: userId, id: id, title: title, body: body);

  // @override
  // // ignore: override_on_non_overriding_member
  // List<Object?> get props => [userId, id, title, body];
}
