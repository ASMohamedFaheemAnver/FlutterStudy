part of 'edittodo_cubit.dart';

@immutable
abstract class EditToDoState {}

class EditToDoStartingState extends EditToDoState {}

class EditToDoError extends EditToDoState {
  final String error;
  EditToDoError({required this.error});
}

class EditToDoLoading extends EditToDoState {}

class ToDoEdited extends EditToDoState {}

class DeleteToDoLoading extends EditToDoState {}
