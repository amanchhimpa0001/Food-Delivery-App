import 'dart:convert';

class UserModel {
  String Name;
  String email;
  String password;
  String number;
  String Address;
  String Street;
  String Postcode;
  String Appartmant;

  UserModel(
      {required this.Name,
      required this.email,
      required this.password,
      required this.number,
      required this.Address,
      required this.Street,
      required this.Postcode,
      required this.Appartmant});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Name': Name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'number': number});
    result.addAll({'Address': Address});
    result.addAll({'Street': Street});
    result.addAll({'Postcode': Postcode});
    result.addAll({'Appartmant': Appartmant});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      Name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      number: map['number'] ?? '',
      Address: map['Address'] ?? '',
      Street: map['Street'] ?? '',
      Postcode: map['Postcode'] ?? '',
      Appartmant: map['Appartmant'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
