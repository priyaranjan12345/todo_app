import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

void main() {
  group('TodoModel', () {
    const testId = '1';
    const testTitle = 'Test Title';
    const testDescription = 'Test Description';
    const testIsCompleted = false;

    test('should create a TodoModel from constructor', () {
      const todo = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );

      expect(todo.id, testId);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, testIsCompleted);
    });

    test('should convert TodoModel to Map', () {
      const todo = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );

      final map = todo.toMap();
      final expectedMap = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': testIsCompleted,
      };

      expect(map, expectedMap);
    });

    test('should create TodoModel from Map', () {
      final map = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': testIsCompleted,
      };

      final todo = TodoModel.fromMap(map);

      expect(todo.id, testId);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, testIsCompleted);
    });

    test('should convert TodoModel to JSON string', () {
      const todo = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );

      final todoJson = todo.toJson();
      final expectedTodoJson = json.encode({
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': testIsCompleted,
      });

      expect(todoJson, expectedTodoJson);
    });

    test('should create TodoModel from JSON string', () {
      final todoJson = json.encode({
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': testIsCompleted,
      });

      final todo = TodoModel.fromJson(todoJson);

      expect(todo.id, testId);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, testIsCompleted);
    });

    test('should create a copy of TodoModel with modified properties', () {
      const originalTodo = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );

      final updatedTodo = originalTodo.copyWith(
        title: 'Updated Title',
        isCompleted: true,
      );

      expect(updatedTodo.id, testId);
      expect(updatedTodo.title, 'Updated Title');
      expect(updatedTodo.description, testDescription);
      expect(updatedTodo.isCompleted, true);
    });
  });
}
