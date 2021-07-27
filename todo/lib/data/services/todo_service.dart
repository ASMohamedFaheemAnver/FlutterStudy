import 'dart:convert';

import 'package:http/http.dart';

class ToDoService {
  final baseUrl = "http://192.168.8.110:3000";
  Future<List<dynamic>> fetchToDo() async {
    try {
      final res = await get(Uri.parse(baseUrl + "/todos"));
      return jsonDecode(res.body) as List;
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<bool> patchToDo(int id, Map<String, String> patchedToDo) async {
    try {
      await patch(Uri.parse(baseUrl + "/todos/" + id.toString()),
          body: patchedToDo);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<Map?> addToDo(Map<String, String> toDoData) async {
    try {
      final res = await post(Uri.parse(baseUrl + "/todos"), body: toDoData);
      return jsonDecode(res.body) as Map;
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<bool> deleteToDo(int id) async {
    try {
      await delete(Uri.parse(baseUrl + "/todos/" + id.toString()));
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<bool> updateToDo(int id, Map<String, String> patchedToDo) async {
    try {
      await patch(Uri.parse(baseUrl + "/todos/" + id.toString()),
          body: patchedToDo);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
