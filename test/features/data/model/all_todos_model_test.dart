import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';

void main() {
  group('AllTodosModel', () {
    const testName = 'Test Name';
    final testTodos = [
      const TodoModel(
        id: '1',
        title: 'Test Todo 1',
        description: 'Description 1',
        isCompleted: false,
      ),
      const TodoModel(
        id: '2',
        title: 'Test Todo 2',
        description: 'Description 2',
        isCompleted: true,
      ),
    ];

    test('should create AllTodosModel from constructor', () {
      final allTodos = AllTodosModel(
        name: testName,
        todos: testTodos,
      );

      expect(allTodos.name, testName);
      expect(allTodos.todos, testTodos);
    });

    test('should convert AllTodosModel to Map', () {
      final allTodos = AllTodosModel(
        name: testName,
        todos: testTodos,
      );

      final map = allTodos.toMap();
      final expectedMap = {
        'name': testName,
        'todos': testTodos.map((x) => x.toMap()).toList(),
      };

      expect(map, expectedMap);
    });

    test('should create AllTodosModel from Map', () {
      final map = {
        'name': testName,
        'todos': testTodos.map((x) => x.toMap()).toList(),
      };

      final allTodos = AllTodosModel.fromMap(map);

      expect(allTodos.name, testName);
      expect(allTodos.todos, testTodos);
    });

    test('should convert AllTodosModel to JSON string', () {
      final allTodos = AllTodosModel(
        name: testName,
        todos: testTodos,
      );

      final todoJson = allTodos.toJson();
      final expectedJson = json.encode({
        'name': testName,
        'todos': testTodos.map((x) => x.toMap()).toList(),
      });

      expect(todoJson, expectedJson);
    });

    test('should create AllTodosModel from JSON string', () {
      final todoJson = json.encode({
        'name': testName,
        'todos': testTodos.map((x) => x.toMap()).toList(),
      });

      final allTodos = AllTodosModel.fromJson(todoJson);

      expect(allTodos.name, testName);
      expect(allTodos.todos, testTodos);
    });

    test('should create a copy of AllTodosModel with modified properties', () {
      final originalAllTodos = AllTodosModel(
        name: testName,
        todos: testTodos,
      );

      final updatedAllTodos = originalAllTodos.copyWith(
        name: 'Updated Name',
        todos: [
          ...testTodos,
          const TodoModel(
            id: '3',
            title: 'Test Todo 3',
            description: 'Description 3',
            isCompleted: false,
          ),
        ],
      );

      expect(updatedAllTodos.name, 'Updated Name');
      expect(updatedAllTodos.todos.length, 3);
      expect(updatedAllTodos.todos.last.title, 'Test Todo 3');
    });
  });
}
