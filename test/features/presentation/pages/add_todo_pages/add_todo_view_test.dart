import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/add_todo_pages/add_todo_view.dart';
import 'package:todo_app/injection_container.dart';

import '../../../mock/add_todo_bloc_mock.dart';

void main() {
  late MockAddTodoBloc mockAddTodoBloc;

  group('AddTodoPage renders correctly for initial state', () {
    setUp(() {
      mockAddTodoBloc = MockAddTodoBloc();
      when(() => mockAddTodoBloc.stream).thenAnswer(
        (invocation) => Stream.value(const AddTodoInitial()),
      );
      when(() => mockAddTodoBloc.state).thenAnswer(
        (invocation) => const AddTodoInitial(),
      );
      injector.registerFactory<AddTodoBloc>(() => mockAddTodoBloc);
    });

    tearDown(() {
      injector.reset();
    });

    testWidgets('AddTodoPage renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: injector<AddTodoBloc>(),
              child: const AddTodoView(),
            ),
          ),
        ),
      );

      expect(find.byType(AddTodoView), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Add todo'), findsOneWidget);
    });
  });

  group('AddTodoPage renders correctly for error state', () {
    setUp(() {
      mockAddTodoBloc = MockAddTodoBloc();
      when(() => mockAddTodoBloc.stream).thenAnswer(
        (invocation) => Stream.value(const AddTodoError()),
      );
      when(() => mockAddTodoBloc.state).thenAnswer(
        (invocation) => const AddTodoError(),
      );
      injector.registerFactory<AddTodoBloc>(() => mockAddTodoBloc);
    });

    tearDown(() {
      injector.reset();
    });

    testWidgets('AddTodoPage renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: injector<AddTodoBloc>(),
              child: const AddTodoView(),
            ),
          ),
        ),
      );

      expect(find.byType(AddTodoView), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
