import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_pages/todo_page.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_tile.dart';
import 'package:todo_app/injection_container.dart';

import '../../../mock/todo_bloc_mock.dart';

void main() {
  late MockTodoBloc mockTodoBloc;

  group(
    'renders TodoPage with empty todos',
    () {
      setUp(() {
        mockTodoBloc = MockTodoBloc();
        when(() => mockTodoBloc.stream).thenAnswer(
          (invocation) => Stream.value(const TodoState(status: Status.success)),
        );
        when(() => mockTodoBloc.state).thenAnswer(
          (invocation) => const TodoState(status: Status.success),
        );
        injector.registerFactory<TodoBloc>(() => mockTodoBloc);
      });

      tearDown(() {
        injector.reset();
      });

      testWidgets('AddTodoPage renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: injector<TodoBloc>(),
                child: const TodoPageWrapper(),
              ),
            ),
          ),
        );

        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text('Todos'), findsOneWidget);

        expect(find.byType(FloatingActionButton), findsOneWidget);

        expect(find.text('No todos'), findsOneWidget);
      });
    },
  );

  group(
    'check todo list render correctly',
    () {
      const todo1 = Todo(
        id: '1',
        title: 'Different Title',
        description: 'Different Description',
        isCompleted: true,
      );
      const todo2 = Todo(
        id: '2',
        title: 'Different Title',
        description: 'Different Description',
        isCompleted: true,
      );
      setUp(() {
        mockTodoBloc = MockTodoBloc();
        when(() => mockTodoBloc.stream).thenAnswer(
          (invocation) => Stream.value(
            const TodoState(
              status: Status.success,
              todos: [todo1, todo2],
            ),
          ),
        );
        when(() => mockTodoBloc.state).thenAnswer(
          (invocation) => const TodoState(
            status: Status.success,
            todos: [todo1, todo2],
          ),
        );
        injector.registerFactory<TodoBloc>(() => mockTodoBloc);
      });

      tearDown(() {
        injector.reset();
      });

      testWidgets('TodoPage renders correctly', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: injector<TodoBloc>(),
                child: const TodoPageWrapper(),
              ),
            ),
          ),
        );

        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text('Todos'), findsOneWidget);

        expect(find.byType(FloatingActionButton), findsOneWidget);

        expect(find.byType(TodoTile), findsNWidgets(2));
      });
    },
  );
}
