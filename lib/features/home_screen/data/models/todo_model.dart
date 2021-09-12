import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required title,
    isChecked = false,
  }) : super(
          title: title,
          isChecked: isChecked,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'] ?? "",
      isChecked: (json['isChecked']) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isChecked': isChecked,
    };
  }
}
