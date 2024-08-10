import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Todo extends Equatable {
  final String? id;
  final String title;
  final String description;
  final bool isCompleted;

  const Todo({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}
