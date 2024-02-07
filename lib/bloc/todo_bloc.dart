import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<String> todolist = [];

  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_addtodoevent);
    on<DeleteTodoEvent>(_deletetoevent);
  }

  FutureOr<void> _addtodoevent(AddTodoEvent event, Emitter<TodoState> emit) {
    todolist.add(event.currenttodo);
    emit(state.copyWith(newtodo: List.from(todolist)));
  }

  FutureOr<void> _deletetoevent(
      DeleteTodoEvent event, Emitter<TodoState> emit) {
    todolist.remove(event.currentitemtodelete);
    emit(state.copyWith(newtodo: List.from(todolist)));
  }
}
