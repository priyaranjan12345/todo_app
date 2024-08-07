import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Todo extends Equatable {
  final String title;
  final String description;

  const Todo({
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [
        title,
        description,
      ];
}
