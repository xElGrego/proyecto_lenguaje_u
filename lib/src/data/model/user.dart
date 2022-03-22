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
        log("v $v['authority']");
        authorities!.add(v["authority"]);
      });
    }
  }

 /*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bearer'] = bearer;
    data['token'] = token;
    data['correo'] = correo;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    return data;
  } */
}

/* class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['authority'] = authority;
    return data;
  }
} */