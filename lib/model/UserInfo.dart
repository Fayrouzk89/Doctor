import 'dart:io';

class UserInfo {
  UserInfo({
    required this.id,
    required this.first_name,
    required this.second_name,
    required this.email,
    required this.password,
    required this.password_confirmation,
    required this.gender,
    required this.type,
  });
  late final int id;
  late final String first_name;
  late final String second_name;
  late final String email;
  late final String password;
  late final String password_confirmation;
  late final String gender;
  late final String type;
  late  String? profile=null;
  String?deviceType;
  String?otp_code;
  String accessToken="";
  String fcmToken="";
  File? imageFile;
  bool isEmptyPassword=false;
  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    first_name = json['first_name'];
    second_name = json['second_name'];
    email = json['email'];
    password = json['password'];
    password_confirmation = json['password_confirmation'];
    gender = json['gender'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = first_name;
    _data['second_name'] = second_name;
    _data['email'] = email;
    _data['password'] = password;
    _data['gender'] = gender;
    _data['type'] = type;
    return _data;
  }
}