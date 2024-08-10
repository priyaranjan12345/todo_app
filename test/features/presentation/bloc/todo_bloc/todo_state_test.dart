import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

void main() {
  group('TodoState', () {
    test('supports value equality', () {
      const state1 = TodoState(
        todos: [
          Todo(
            id: '1',
            title: 'Test Todo',
            description: 'Description',
          ),
        ],
        status: Status.loading,
        todoFilter: TodoFilter.completed,
      );
      const state2 = TodoState(
        todos: [
          Todo(
            id: '1',
            title: 'Test Todo',
            description: 'Description',
          ),
        ],
        status: Status.loading,
        todoFilter: TodoFilter.completed,
      );
      const state3 = TodoState(
        todos: [
          Todo(
            id: '2',
            title: 'Another Todo',
            description: 'Description',
          ),
        ],
        status: Status.success,
        todoFilter: TodoFilter.all,
      );

      expect(state1, state2);
      expect(state1, isNot(state3));
    });

    test('copyWith returns a new instance with updated properties', () {
      const state = TodoState(
        todos: [
          Todo(
            id: '1',
            title: 'Test Todo',
            description: 'Description',
          ),
        ],
        status: Status.initial,
        todoFilter: TodoFilter.all,
      );

      final updatedState = state.copyWith(
        todos: [
          const Todo(
            id: '2',
            title: 'Updated Todo',
            description: 'Updated Description',
          ),
        ],
        status: Status.loading,
      );

      expect(
        updatedState.todos,
        [
          const Todo(
            id: '2',
            title: 'Updated Todo',
            description: 'Updated Description',
          )
        ],
      );
      expect(updatedState.status, Status.loading);
      expect(updatedState.todoFilter, TodoFilter.all);
    });

    test('default values are correct', () {
      const state = TodoState();

      expect(state.todos, isNull);
      expect(state.status, Status.initial);
      expect(state.todoFilter, TodoFilter.all);
    });
  });
}
