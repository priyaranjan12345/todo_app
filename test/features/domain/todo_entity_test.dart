import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/domain/entity/todo_entity.dart';

void main() {
  group('Todo', () {
    const testId = '1';
    const testTitle = 'Test Title';
    const testDescription = 'Test Description';
    const testIsCompleted = false;

    test('should create a Todo instance with provided values', () {
      const todo = Todo(
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

    test('should have the correct props for equality comparison', () {
      const todo1 = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );
      const todo2 = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
      );
      const todo3 = Todo(
        id: '2',
        title: 'Different Title',
        description: 'Different Description',
        isCompleted: true,
      );

      expect(todo1, equals(todo2));
      expect(todo1, isNot(equals(todo3)));
    });
  });
}
