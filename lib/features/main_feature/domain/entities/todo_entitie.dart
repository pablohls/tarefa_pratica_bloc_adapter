class Todo {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  // @override
  // // ignore: override_on_non_overriding_member
  // List<Object?> get props => [userId, id, title, body];
}
