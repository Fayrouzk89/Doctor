import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../globals.dart' as globals;
import '../model/UserInfo.dart';
import 'Api.dart';
import 'apiUtils.dart';
import 'response/LoginReponse.dart';

final title = "ApiRepo";

class ApiRepo {
  Future<LoginResponse?> validateUser(UserInfo userInfo) async {

    String url = Api.getLogin();
    var formData = FormData.fromMap({
      'email': userInfo.email,
      'password':  userInfo.password
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return LoginResponse.fromJson(response.data);
      }

      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
    if(e.response!=null){
      return LoginResponse.fromJson(e.response!.data);
    }else{
    print(e.message);
    return null;
    }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<LoginResponse?> registerUser(UserInfo userInfo) async {

    String url = Api.getRegister();
    var formData = FormData.fromMap({
      'name': userInfo.first_name,
      'email':  userInfo.email,
      'password':  userInfo.password,
      'c_password':  userInfo.password_confirmation
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return LoginResponse.fromJson(response.data);
      }

      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return LoginResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
}
