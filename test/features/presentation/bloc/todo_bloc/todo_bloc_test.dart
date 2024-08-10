import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

import '../../../mock/todo_repository_mock.dart';

void main() {
  late MockTodoRepository mockRepository;
  late TodoBloc todoBloc;

  setUp(() {
    mockRepository = MockTodoRepository();
    todoBloc = TodoBloc(repository: mockRepository);

    registerFallbackValue(
      const Todo(
        id: '1',
        title: 'Test Todo',
        description: 'Description',
      ),
    );
  });

  group('TodoBloc', () {
    test('initial state is TodoState()', () {
      expect(todoBloc.state, const TodoState());
    });

    blocTest<TodoBloc, TodoState>(
      'emits [loading, success] when GetTodosEvent is added and repository returns todos',
      build: () {
        when(() => mockRepository.getAllTodos()).thenReturn(
          const Right(
            AllTodosModel(
              name: 'All Todos',
              todos: [
                TodoModel(
                  id: '1',
                  title: 'Test Todo',
                  description: 'Description',
                )
              ],
            ),
          ),
        );
        return todoBloc;
      },
      act: (bloc) => bloc.add(const GetTodosEvent()),
      expect: () => [
        const TodoState(status: Status.loading),
        const TodoState(
          status: Status.success,
          todos: [
            TodoModel(
              id: '1',
              title: 'Test Todo',
              description: 'Description',
            )
          ],
        ),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [loading, error] when GetTodosEvent is added and repository fails',
      build: () {
        when(() => mockRepository.getAllTodos()).thenReturn(
          Left(Exception('Failed to load todos')),
        );
        return todoBloc;
      },
      act: (bloc) => bloc.add(const GetTodosEvent()),
      expect: () => [
        const TodoState(status: Status.loading),
        const TodoState(status: Status.error),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [success] when DeleteTodoEvent is added and repository succeeds',
      build: () {
        when(() => mockRepository.deleteTodo(any())).thenAnswer(
          (_) async => const Right(true),
        );
        when(() => mockRepository.getAllTodos()).thenReturn(
          const Right(AllTodosModel(name: 'All Todos', todos: [])),
        );
        return todoBloc;
      },
      act: (bloc) => bloc.add(
        const DeleteTodoEvent(
          todo: TodoModel(
            id: '1',
            title: 'Test Todo',
            description: 'Description',
          ),
        ),
      ),
      expect: () => [
        const TodoState(status: Status.loading),
        const TodoState(status: Status.success, todos: []),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [success] when ToggleTodoCompletedEvent is added and repository succeeds',
      build: () {
        when(() => mockRepository.toggleTodoComplete(any())).thenAnswer(
          (_) async => const Right(true),
        );
        when(() => mockRepository.getAllTodos()).thenReturn(
          const Right(AllTodosModel(name: 'All Todos', todos: [])),
        );
        return todoBloc;
      },
      act: (bloc) => bloc.add(const ToggleTodoCompletedEvent(todoId: '1')),
      expect: () => [
        const TodoState(status: Status.loading),
        const TodoState(status: Status.success, todos: []),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [new state] when FilterTodoEvent is added',
      build: () => todoBloc,
      act: (bloc) =>
          bloc.add(const FilterTodoEvent(todoFilter: TodoFilter.completed)),
      expect: () => [
        const TodoState(todoFilter: TodoFilter.completed),
      ],
    );
  });
}
