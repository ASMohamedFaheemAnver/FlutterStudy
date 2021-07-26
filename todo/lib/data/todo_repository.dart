import 'package:todo/data/models/todo.dart';
import 'package:todo/data/services/todo_service.dart';

class ToDoRepository {
  final ToDoService toDoService;
  ToDoRepository({required this.toDoService});
  Future<List<ToDo>> fetchToDo() async {
    final toDoList = await toDoService.fetchToDo();
    return toDoList.map((e) => ToDo.fromJson(e)).toList();
  }

  Future<bool> changeCompletion(int id, bool isCompleted) async {
    final patchedToDo = {"isCompleted": isCompleted.toString()};
    return await toDoService.patchToDo(id, patchedToDo);
  }
}
