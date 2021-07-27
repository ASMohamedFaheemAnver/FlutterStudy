class ToDo {
  int id;
  String todoMessage;
  bool isCompleted;
  bool isLoading;

  ToDo.fromJson(Map json)
      : id = json["id"] as int,
        todoMessage = json["todo_message"],
        isCompleted = json["is_completed"] == "true",
        isLoading = false;
}
