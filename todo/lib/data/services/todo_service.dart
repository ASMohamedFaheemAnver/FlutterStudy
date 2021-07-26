import 'dart:convert';

import 'package:http/http.dart';

class ToDoService {
  final baseUrl = "http://192.168.8.110:3000";
  Future<List<dynamic>> fetchToDo() async {
    try {
      final res = await get(Uri.parse(baseUrl + "/todos"));
      return jsonDecode(res.body) as List;
    } catch (e) {
      return [];
    }
  }

  Future<bool> patchToDo(int id, Map<String, String> patchedToDo) async {
    try {
      await patch(Uri.parse(baseUrl + "/todos/" + id.toString()),
          body: patchedToDo);
      return true;
    } catch (e) {
      return false;
    }
  }
}
