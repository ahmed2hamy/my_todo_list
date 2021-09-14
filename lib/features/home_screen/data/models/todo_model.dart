import 'package:my_todo_list/features/home_screen/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required dateCreated,
    required title,
    isChecked = false,
  }) : super(
          dateCreated: dateCreated,
          title: title,
          isChecked: isChecked,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      dateCreated: json['date_created'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date_created'])
          : DateTime.now(),
      title: json['title'] ?? "",
      isChecked: (json['isChecked']) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date_created': dateCreated.millisecondsSinceEpoch,
      'title': title,
      'isChecked': isChecked,
    };
  }
}
