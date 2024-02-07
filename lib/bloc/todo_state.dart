part of 'todo_bloc.dart';

final class TodoState extends Equatable {
  final List<String> todolist;

  TodoState({this.todolist = const []});

  TodoState copyWith({List<String>? newtodo}) {
    return TodoState(todolist: newtodo ?? this.todolist);
  }

  @override
  List<Object?> get props => [todolist];
}
