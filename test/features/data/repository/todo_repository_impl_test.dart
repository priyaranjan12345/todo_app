import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/data/datasource/datasource.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository_impl.dart';

class MockTodoLocalDatasource extends Mock implements TodoLocalDatasource {}

void main() {
  late MockTodoLocalDatasource mockDatasource;
  late TodoRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockTodoLocalDatasource();
    repository = TodoRepositoryImpl(datasource: mockDatasource);
  });

  group('TodoRepositoryImpl', () {
    const testTodo = TodoModel(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
    );
    const testTodoId = '1';
    const allTodos = AllTodosModel(
      name: 'all_todos',
      todos: [testTodo],
    );

    test('should return Right(true) when addTodo is successful', () async {
      when(() => mockDatasource.addTodo(testTodo)).thenAnswer((_) async => true);

      final result = await repository.addTodo(testTodo);

      expect(result, const Right(true));
      verify(() => mockDatasource.addTodo(testTodo)).called(1);
    });

    test('should return Left(Exception) when addTodo fails', () async {
      when(() => mockDatasource.addTodo(testTodo)).thenThrow(Exception('Some error'));

      final result = await repository.addTodo(testTodo);

      expect(result, isA<Left<Exception, bool>>());
      verify(() => mockDatasource.addTodo(testTodo)).called(1);
    });

    test('should return Right(true) when deleteTodo is successful', () async {
      when(() => mockDatasource.deleteTodo(testTodo)).thenAnswer((_) async => true);

      final result = await repository.deleteTodo(testTodo);

      expect(result, const Right(true));
      verify(() => mockDatasource.deleteTodo(testTodo)).called(1);
    });

    test('should return Left(Exception) when deleteTodo fails', () async {
      when(() => mockDatasource.deleteTodo(testTodo)).thenThrow(Exception('Some error'));

      final result = await repository.deleteTodo(testTodo);

      expect(result, isA<Left<Exception, bool>>());
      verify(() => mockDatasource.deleteTodo(testTodo)).called(1);
    });

    test('should return Right(AllTodosModel) when getAllTodos is successful', () {
      when(() => mockDatasource.getTodo()).thenReturn(allTodos);

      final result = repository.getAllTodos();

      expect(result, const Right(allTodos));
      verify(() => mockDatasource.getTodo()).called(1);
    });

    test('should return Left(Exception) when getAllTodos fails', () {
      when(() => mockDatasource.getTodo()).thenThrow(Exception('Some error'));

      final result = repository.getAllTodos();

      expect(result, isA<Left<Exception, AllTodosModel>>());
      verify(() => mockDatasource.getTodo()).called(1);
    });

    test('should return Right(true) when toggleTodoComplete is successful', () async {
      when(() => mockDatasource.toggleTodoComplete(testTodoId)).thenAnswer((_) async => true);

      final result = await repository.toggleTodoComplete(testTodoId);

      expect(result, const Right(true));
      verify(() => mockDatasource.toggleTodoComplete(testTodoId)).called(1);
    });

    test('should return Left(Exception) when toggleTodoComplete fails', () async {
      when(() => mockDatasource.toggleTodoComplete(testTodoId)).thenThrow(Exception('Some error'));

      final result = await repository.toggleTodoComplete(testTodoId);

      expect(result, isA<Left<Exception, bool>>());
      verify(() => mockDatasource.toggleTodoComplete(testTodoId)).called(1);
    });
  });
}
