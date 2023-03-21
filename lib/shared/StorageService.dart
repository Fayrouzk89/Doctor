import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals.dart' as globals;
import '../api/response/LoginReponse.dart';
import '../model/UserInfo.dart';
import 'StorageConstants.dart';
class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return SharedPreferences.getInstance();
  }
  static Future<bool> saveLang(String lang) async {
    globals.lang=lang;
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.lang, lang);
    prefs.commit();
    return true;
  }


  static Future<bool> saveUserInfo(Data user) async {

    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.accessToken, user.token!);
    prefs.setString(StorageConstants.first_name, user.name!);
    prefs.commit();
    LoadUser();
    return true;
  }
  static Future<bool> LoadUser() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    globals.lang = sharedPreferences.getString('lang') ?? '';
    String first_name = sharedPreferences.getString(
        StorageConstants.first_name) ??
        "";
    String accessToken = sharedPreferences.getString(
        StorageConstants.accessToken) ?? "";


    UserInfo userInfo = UserInfo(id: 0,
        first_name: first_name,
        second_name: '',
        password: "",
        password_confirmation: "",
        gender: 'gender',
        type: 'type', email: '');
    userInfo.accessToken=accessToken;

    globals.userInfo=userInfo;
    return true;
  }
  static Future ResetInfo()async {
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.first_name, "");
    prefs.setString(StorageConstants.accessToken,"");
    globals.userInfo=null;
    prefs.commit();
    globals.userInfo=null;

  }



}