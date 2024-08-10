import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';

void main() {
  group('AddTodoEvent', () {
    test('props of SaveEvent are correct', () {
      const testTodo = TodoModel(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
      );
      const event = SaveEvent(todo: testTodo);

      expect(event.todo, testTodo);
      expect(event.props, [testTodo]);
    });

    test('SaveEvent equality works correctly', () {
      const todo1 = TodoModel(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
      );
      const todo2 = TodoModel(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
      );
      const event1 = SaveEvent(todo: todo1);
      const event2 = SaveEvent(todo: todo2);
      final event3 = SaveEvent(todo: todo1.copyWith(title: 'Different Title'));

      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });
  });
}
