import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/datasource/datasource.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPreferences;
  late TodoLocalDatasourceImpl datasource;

  setUp(() {
    mockPreferences = MockSharedPreferences();
    datasource = TodoLocalDatasourceImpl(
      preferences: mockPreferences,
    );
  });

  group('TodoLocalDatasourceImpl', () {
    const todo = TodoModel(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
    );
    const allTodos = AllTodosModel(
      name: 'all_todos',
      todos: [todo],
    );

    test('should add a todo successfully', () async {
      /// arrenge
      when(() => mockPreferences.getString('todos'))
          .thenReturn(json.encode(allTodos.toMap()));
      when(() => mockPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      /// act
      final result = await datasource.addTodo(todo.copyWith(id: 'new_id'));

      /// assert
      expect(result, true);
      verify(() => mockPreferences.setString('todos', any())).called(1);
    });

    test('should delete a todo successfully', () async {
      when(() => mockPreferences.getString('todos'))
          .thenReturn(json.encode(allTodos.toMap()));
      when(() => mockPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      final result = await datasource.deleteTodo(todo);

      expect(result, true);
      verify(() => mockPreferences.setString('todos', any())).called(1);
    });

    test('should toggle todo completion status', () async {
      when(() => mockPreferences.getString('todos'))
          .thenReturn(json.encode(allTodos.toMap()));
      when(() => mockPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      final result = await datasource.toggleTodoComplete('1');

      expect(result, true);
      verify(() => mockPreferences.setString('todos', any())).called(1);
    });

    test('should return default AllTodosModel if no data is present', () {
      when(() => mockPreferences.getString('todos')).thenReturn(null);

      final result = datasource.getTodo();

      expect(result.todos, isEmpty);
    });
  });
}
