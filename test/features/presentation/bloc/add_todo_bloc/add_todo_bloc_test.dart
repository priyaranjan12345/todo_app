import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';

import '../../../mock/todo_repository_mock.dart';

void main() {
  late MockTodoRepository mockRepository;
  late AddTodoBloc addTodoBloc;

  setUp(() {
    mockRepository = MockTodoRepository();
    addTodoBloc = AddTodoBloc(repository: mockRepository);
  });

  tearDown(() {
    addTodoBloc.close();
  });

  group('AddTodoBloc', () {
    const testTodo = TodoModel(
      id: '1',
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
    );

    test('initial state is AddTodoInitial', () {
      expect(addTodoBloc.state, const AddTodoInitial());
    });

    blocTest<AddTodoBloc, AddTodoState>(
      'emits [AddTodoLoading, AddTodoLoaded] when SaveEvent is added and repository call is successful',
      build: () {
        when(() => mockRepository.addTodo(testTodo))
            .thenAnswer((_) async => const Right(true));
        return addTodoBloc;
      },
      act: (bloc) => bloc.add(const SaveEvent(todo: testTodo)),
      expect: () => [
        const AddTodoLoading(),
        const AddTodoLoaded(),
      ],
      verify: (_) {
        verify(() => mockRepository.addTodo(testTodo)).called(1);
      },
    );

    blocTest<AddTodoBloc, AddTodoState>(
      'emits [AddTodoLoading, AddTodoError] when SaveEvent is added and repository call fails',
      build: () {
        when(() => mockRepository.addTodo(testTodo))
            .thenThrow(Exception('Failed to add todo'));
        return addTodoBloc;
      },
      act: (bloc) => bloc.add(const SaveEvent(todo: testTodo)),
      expect: () => [
        const AddTodoLoading(),
        const AddTodoError(),
      ],
      verify: (_) {
        verify(() => mockRepository.addTodo(testTodo)).called(1);
      },
    );
  });
}
