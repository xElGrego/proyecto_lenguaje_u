import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/list_task.dart';
import '../services/url.dart';

Future<ListTask> getTask() async {


  final response = await http.get(Uri.parse(AppUrl.listTask),headers: {
    'Content-Type' : 'application/json', /* Token de estudiante */
    'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZXltYXJAZ21haWwuY29tIiwiZnVsbG5hbWUiOiJOZXltYXIgTWFsZXRhIiwiaWQiOjQsInJvb21zIjpbeyJpZFNhbGEiOjMsIm5vbWJyZSI6Ikxlbmd1YSB5IGxpdGVyYXR1cmEgMjAyMiBDMiIsInBlcnNvbmFzIjpudWxsLCJtYXRlcmlhIjpudWxsLCJjdXJzbyI6bnVsbH1dLCJleHAiOjE2NDk0NjE1NTEsImlhdCI6MTY0OTQyNTU1MX0.COjv_4bgiqy1sPNpyEZ4hd-mn40w45LwxtJsBhw4EnA'
  });

  
  if (response.statusCode == 200) {
    
    final Map<String, dynamic> responseData = json.decode(response.body);
    ListTask listaClases = ListTask.fromJson(responseData);
    return listaClases;
  } else {

    throw Exception('Failed to load');
  }
}