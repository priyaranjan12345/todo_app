import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'todo_model.dart';

class AllTodosModel extends Equatable {
  const AllTodosModel({
    required this.name,
    required this.todos,
  });

  final String name;
  final List<TodoModel> todos;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'todos': todos.map((x) => x.toMap()).toList(),
    };
  }

  factory AllTodosModel.fromMap(Map<String, dynamic> map) {
    return AllTodosModel(
      name: map['name'] ?? '',
      todos:
          List<TodoModel>.from(map['todos']?.map((x) => TodoModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllTodosModel.fromJson(String source) =>
      AllTodosModel.fromMap(json.decode(source));

  AllTodosModel copyWith({
    String? name,
    List<TodoModel>? todos,
  }) {
    return AllTodosModel(
      name: name ?? this.name,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [
        name,
        todos,
      ];
}
