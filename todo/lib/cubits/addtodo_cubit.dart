import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/cubits/todo_cubit.dart';
import 'package:todo/data/todo_repository.dart';

part 'addtodo_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  final ToDoRepository toDoRepository;
  final ToDoCubit toDoCubit;
  AddToDoCubit({required this.toDoRepository, required this.toDoCubit})
      : super(AddToDoStartingState());

  void addToDo(String message) {
    if (message.isEmpty) {
      emit(AddToDoError(error: "ToDo Message is empty"));
      return;
    }
    emit(AddToDoLoading());
    Timer(Duration(seconds: 2), () async {
      final toDo = await toDoRepository.addToDo(message);
      if (toDo != null) {
        toDoCubit.addToDo(toDo);
      }
      emit(ToDoAdded());
    });
  }
}
