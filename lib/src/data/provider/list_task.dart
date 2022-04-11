import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/list_task.dart';
import '../services/url.dart';

Future<List<ListTask>> getTask(String token) async {


  final response = await http.get(Uri.parse(AppUrl.listTask),headers: {
    'Authorization': token,
    'Content-Type' : 'application/json',
  });

  if (response.statusCode == 200) {
     List<ListTask> listTask = (json.decode(response.body) as List)
        .map((data) => ListTask.fromJson(data))
        .toList();
    return listTask; 
  } else {
    log("Error list task");
    throw Exception('Failed to load');
  }
}
