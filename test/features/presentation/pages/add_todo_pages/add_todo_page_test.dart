import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';

import 'package:todo_app/features/todo/presentation/pages/add_todo_pages/add_todo_page.dart';
import 'package:todo_app/injection_container.dart';

import '../../../mock/add_todo_bloc_mock.dart';

void main() {
  late MockAddTodoBloc mockAddTodoBloc;

  setUp(() {
    mockAddTodoBloc = MockAddTodoBloc();
    when(() => mockAddTodoBloc.stream).thenAnswer(
      (invocation) => Stream.value(const AddTodoInitial()),
    );
    when(() => mockAddTodoBloc.state).thenAnswer(
      (invocation) => const AddTodoInitial(),
    );
    when(() => mockAddTodoBloc.close()).thenAnswer(
      (invocation) => Future.value(),
    );
    injector.registerFactory<AddTodoBloc>(() => mockAddTodoBloc);
  });

  tearDown(() {
    injector.reset();
  });
  group('AddTodoPage', () {
    testWidgets('renders AddTodoPage', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AddTodoPage()));
      await tester.pumpAndSettle();
      expect(find.byType(AddTodoPage), findsOneWidget);
    });
  });
}
