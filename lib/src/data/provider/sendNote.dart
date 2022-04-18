import 'package:http/http.dart' as http;
import '../services/url.dart';

Future<Map<String, dynamic>> calificarTarea(String token, String idTarea, String nota) async {
  Map<String, dynamic> result;

  Map<String, String> headers = {
    'cache-control': 'no-cache',
    "Content-Type": "multipart/form-data",
    'authorization': token };

  var request = http.MultipartRequest(
    'PUT',
    Uri.parse(AppUrl.uploadTaskStuden + idTarea + '/calificar'),
  );
  request.headers.addAll(headers);

  request.fields["cfn"] = nota;
  var res = await request.send();

  if (res.statusCode == 200) {
    result = {'status': true, 'message': 'Successful'};
  } else {
    result = {'status': false, 'message': 'Error'};
  }

  return result;
}
