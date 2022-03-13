class User {
  String? bearer;
  String? token;
  String? correo;
  List<Authorities>? authorities;

  User({this.bearer, this.token, this.correo, this.authorities});

  User.fromJson(Map<String, dynamic> json) {
    bearer = json['bearer'];
    token = json['token'];
    correo = json['correo'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(Authorities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bearer'] = bearer;
    data['token'] = token;
    data['correo'] = correo;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authorities {
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
}