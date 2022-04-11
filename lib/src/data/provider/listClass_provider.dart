import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/list_class.dart';
import '../services/url.dart';

Future<ListaClases> getListClass(String token) async {


  final response = await http.get(Uri.parse(AppUrl.listaClase),headers: {
    'Content-Type' : 'application/json',
    'Authorization': token
  });

  
  if (response.statusCode == 200) {
    
    final Map<String, dynamic> responseData = json.decode(response.body);
    ListaClases listaClases = ListaClases.fromJson(responseData);
    return listaClases;
  } else {

    throw Exception('Failed to load');
  }
}