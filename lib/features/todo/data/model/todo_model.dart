import 'dart:convert';

import '../../domain/entity/domain.dart';

class TodoModel extends Todo {
  const TodoModel({
    super.id,
    required super.title,
    required super.description,
    super.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? super.id,
      title: title ?? super.title,
      description: description ?? super.description,
      isCompleted: isCompleted ?? super.isCompleted,
    );
  }
}
