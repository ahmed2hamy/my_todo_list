class Todo {
  final DateTime dateCreated;
  final String title;
  bool isChecked;

  Todo({
    required this.dateCreated,
    required this.title,
    this.isChecked = false,
  });
}
