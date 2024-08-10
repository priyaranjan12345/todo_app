import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';

void main() {
  group('AddTodoState', () {
    test('AddTodoInitial equality and props', () {
      const state1 = AddTodoInitial();
      const state2 = AddTodoInitial();

      expect(state1, equals(state2));
      expect(state1.props, isEmpty);
    });

    test('AddTodoLoading equality and props', () {
      const state1 = AddTodoLoading();
      const state2 = AddTodoLoading();

      expect(state1, equals(state2));
      expect(state1.props, isEmpty);
    });

    test('AddTodoLoaded equality and props', () {
      const state1 = AddTodoLoaded();
      const state2 = AddTodoLoaded();

      expect(state1, equals(state2));
      expect(state1.props, isEmpty);
    });

    test('AddTodoError equality and props', () {
      const state1 = AddTodoError();
      const state2 = AddTodoError();

      expect(state1, equals(state2));
      expect(state1.props, isEmpty);
    });
  });
}
