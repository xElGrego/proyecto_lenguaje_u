import 'dart:developer';

class User {
  String? bearer;
  String? token;
  String? correo;
  List<String>? authorities;

  User({this.bearer, this.token, this.correo, this.authorities});

  User.fromJson(Map<String, dynamic> json) {
    bearer = json['bearer'];
    token = json['token'];
    correo = json['correo'];
    if (json['authorities'] != null) {
      authorities = <String>[];
      json['authorities'].forEach((v) {
        authorities!.add(v["authority"]);
      });
    }
  }
}
