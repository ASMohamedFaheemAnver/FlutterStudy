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
    final patchedToDo = {"is_completed": isCompleted.toString()};
    return await toDoService.patchToDo(id, patchedToDo);
  }

  Future<ToDo?> addToDo(String message) async {
    final toDoData = {
      "is_completed": false.toString(),
      "todo_message": message
    };
    final toDo = await toDoService.addToDo(toDoData);
    return toDo != null ? ToDo.fromJson(toDo) : null;
  }
}
