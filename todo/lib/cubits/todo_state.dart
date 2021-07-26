part of 'todo_cubit.dart';

@immutable
abstract class ToDoState {}

class ToDoStartingState extends ToDoState {}

class ToDoLoaded extends ToDoState {
  final List<ToDo> toDoList;
  ToDoLoaded({required this.toDoList});
}
