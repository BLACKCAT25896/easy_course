import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_course/api_handle/api_client.dart';
import 'package:easy_course/util/app_constants.dart';

class AuthenticationRepository{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthenticationRepository( {required this.apiClient, required this.sharedPreferences,});

  Future<Response?> login({required String email, required String password}) async {
    return await apiClient.postData(AppConstants.loginUri,
        {"email": email, "password": password});
  }



  Future<bool?> saveUserToken(String token) async {
    apiClient.updateHeader(token, null);
    return await sharedPreferences.setString(AppConstants.token, token);

  }

  Future<bool?> saveUserId(String id) async {
    return await sharedPreferences.setString(AppConstants.useId, id);

  }
  String getUserId() {
    return sharedPreferences.getString(AppConstants.useId) ?? "";
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }
  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<void> saveEmailAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.userPassword, password);
      await sharedPreferences.setString(AppConstants.userNumber, number);

    } catch (e) {
      rethrow;
    }
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.userNumber);
    return await sharedPreferences.remove(AppConstants.userPassword);
  }

  String getEmail() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }
  String getPassword() {
    return sharedPreferences.getString(AppConstants.userPassword) ?? "";
  }


  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    return true;
  }

}