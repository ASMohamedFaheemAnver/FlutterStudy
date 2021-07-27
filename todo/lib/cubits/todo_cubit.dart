import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/data/todo_repository.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  final ToDoRepository toDoRepository;
  ToDoCubit({required this.toDoRepository}) : super(ToDoStartingState());

  void fetchToDo() async {
    Timer(Duration(seconds: 2), () async {
      final toDoList = await toDoRepository.fetchToDo();
      emit(ToDoLoaded(toDoList: toDoList));
    });
  }

  void changeCompletion(ToDo toDo) async {
    final isChanged =
        await toDoRepository.changeCompletion(toDo.id, !toDo.isCompleted);
    if (isChanged) {
      toDo.isCompleted = !toDo.isCompleted;
      updateToDoList();
    }
  }

  void updateToDoList() {
    final currentState = state;
    if (currentState is ToDoLoaded)
      emit(ToDoLoaded(toDoList: currentState.toDoList));
  }

  void addToDo(ToDo toDo) {
    final currentState = state;
    if (currentState is ToDoLoaded) {
      final toDoList = currentState.toDoList;
      toDoList.add(toDo);
      emit(ToDoLoaded(toDoList: toDoList));
    }
  }
}
