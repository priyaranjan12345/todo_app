import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

void main() {
  group('TodoEvent', () {
    test('GetTodosEvent supports value equality', () {
      expect(const GetTodosEvent(), const GetTodosEvent());
      expect(const GetTodosEvent().props, const GetTodosEvent().props);
    });

    test('ToggleTodoCompletedEvent supports value equality', () {
      const event1 = ToggleTodoCompletedEvent(todoId: '123');
      const event2 = ToggleTodoCompletedEvent(todoId: '123');
      const event3 = ToggleTodoCompletedEvent(todoId: '456');

      expect(event1, event2);
      expect(event1, isNot(event3));
    });

    test('FilterTodoEvent supports value equality', () {
      const filter1 = TodoFilter.all;
      const filter2 = TodoFilter.all;
      const filter3 = TodoFilter.completed;

      const event1 = FilterTodoEvent(todoFilter: filter1);
      const event2 = FilterTodoEvent(todoFilter: filter2);
      const event3 = FilterTodoEvent(todoFilter: filter3);

      expect(event1, event2);
      expect(event1, isNot(event3));
    });

    test('DeleteTodoEvent supports value equality', () {
      const todo1 = Todo(
        id: '1',
        title: 'Test',
        description: 'Test Description',
      );
      const todo2 = Todo(
        id: '1',
        title: 'Test',
        description: 'Test Description',
      );
      const todo3 = Todo(
        id: '2',
        title: 'Different',
        description: 'Different Description',
      );

      const event1 = DeleteTodoEvent(todo: todo1);
      const event2 = DeleteTodoEvent(todo: todo2);
      const event3 = DeleteTodoEvent(todo: todo3);

      expect(event1, event2);
      expect(event1, isNot(event3));
    });
  });
}
