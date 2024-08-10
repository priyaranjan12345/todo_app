import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_pages/todo_page.dart';
import 'package:todo_app/injection_container.dart';

import '../../../mock/todo_bloc_mock.dart';

void main() {
  late MockTodoBloc mockTodoBloc;

  setUp(() {
    mockTodoBloc = MockTodoBloc();
    when(() => mockTodoBloc.stream).thenAnswer(
      (invocation) => Stream.value(const TodoState(status: Status.success)),
    );
    when(() => mockTodoBloc.state).thenAnswer(
      (invocation) => const TodoState(status: Status.success),
    );
    when(() => mockTodoBloc.close()).thenAnswer(
      (invocation) => Future.value(),
    );
    injector.registerFactory<TodoBloc>(() => mockTodoBloc);
  });

  tearDown(() {
    injector.reset();
  });
  group('TodoPage', () {
    testWidgets('renders TodoPage', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoPage()));
      await tester.pumpAndSettle();
      expect(find.byType(TodoPage), findsOneWidget);
    });
  });
}
