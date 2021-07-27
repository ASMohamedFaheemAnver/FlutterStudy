part of 'addtodo_cubit.dart';

@immutable
abstract class AddToDoState {}

class AddToDoStartingState extends AddToDoState {}

class AddToDoError extends AddToDoState {
  final String error;
  AddToDoError({required this.error});
}

class AddToDoLoading extends AddToDoState {}

class ToDoAdded extends AddToDoState {}
