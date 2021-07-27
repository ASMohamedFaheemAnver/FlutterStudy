import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/cubits/todo_cubit.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/data/todo_repository.dart';

part 'edittodo_state.dart';

class EditToDoCubit extends Cubit<EditToDoState> {
  final ToDoRepository toDoRepository;
  final ToDoCubit toDoCubit;
  EditToDoCubit({required this.toDoRepository, required this.toDoCubit})
      : super(EditToDoStartingState());

  void deleteToDo(ToDo toDo) async {
    emit(DeleteToDoLoading());
    Timer(Duration(seconds: 2), () async {
      final isDeleted = await toDoRepository.deleteToDo(toDo.id);

      if (isDeleted) {
        toDoCubit.deleteToDo(toDo);
        emit(ToDoEdited());
      }
    });
  }

  void updateToDo(String message, ToDo toDo) async {
    if (message.isEmpty) {
      emit(EditToDoError(error: "Message is empty"));
      return;
    }
    emit(EditToDoLoading());
    Timer(Duration(seconds: 2), () async {
      final isUpdated = await toDoRepository.updateToDo(toDo.id, message);
      if (isUpdated) {
        toDo.todoMessage = message;
        toDoCubit.updateToDoList();
        emit(ToDoEdited());
      }
    });
  }
}
