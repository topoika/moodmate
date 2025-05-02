part of "models.dart";

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? dob;
  User({this.id, this.name, this.email, this.password, this.dob});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'dob': dob,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
    );
  }
}
