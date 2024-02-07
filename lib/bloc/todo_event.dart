part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class AddTodoEvent extends TodoEvent {
  final String currenttodo;

  AddTodoEvent({required this.currenttodo});
}

final class DeleteTodoEvent extends TodoEvent {
  final Object currentitemtodelete;

  DeleteTodoEvent({required this.currentitemtodelete});
}
