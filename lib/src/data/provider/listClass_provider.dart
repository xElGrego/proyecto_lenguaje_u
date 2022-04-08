import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/list_class.dart';
import '../services/url.dart';

Future<ListaClases> getListClass() async {


  final response = await http.get(Uri.parse(AppUrl.listaClase),headers: {
    'Content-Type' : 'application/json',
    'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdWxpc3NhQGdtYWlsLmNvbSIsImZ1bGxuYW1lIjoiSnVsaXNzYSBNZW5kb3phIFPDoW5jaGV6IiwiaWQiOjEsInJvb21zIjpbeyJpZFNhbGEiOjMsIm5vbWJyZSI6Ikxlbmd1YSB5IGxpdGVyYXR1cmEgMjAyMiBDMiIsInBlcnNvbmFzIjpudWxsLCJtYXRlcmlhIjpudWxsLCJjdXJzbyI6bnVsbH0seyJpZFNhbGEiOjQsIm5vbWJyZSI6Ik1hdGVtw6F0aWNhcyAyMDIyIEMyIiwicGVyc29uYXMiOm51bGwsIm1hdGVyaWEiOm51bGwsImN1cnNvIjpudWxsfV0sImV4cCI6MTY0OTQ3MjE2NywiaWF0IjoxNjQ5NDM2MTY3fQ.WgLJ5fjMK6a94fPY0lFj9xOqrpsGrWwN849VszWwOO4'
  });

  
  if (response.statusCode == 200) {
    
    final Map<String, dynamic> responseData = json.decode(response.body);
    ListaClases listaClases = ListaClases.fromJson(responseData);
    return listaClases;
  } else {

    throw Exception('Failed to load');
  }
}