import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/list_class.dart';
import '../services/url.dart';

Future<List<ListaClases>> getListClass(String token) async {


  final response = await http.get(Uri.parse(AppUrl.listaClase),headers: {
    'Content-Type' : 'application/json',
    'Authorization': token
  });

  if (response.statusCode == 200) {
     List<ListaClases> listaClases = (json.decode(response.body) as List)
        .map((data) => ListaClases.fromJson(data))
        .toList();
    return listaClases;
  } else {

    throw Exception('Failed to load');
  }
}