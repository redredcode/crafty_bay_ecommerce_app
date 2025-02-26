import 'dart:convert';

import 'package:ecommerce_app/features/auth/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/data/models/sign_in_model.dart';

class AuthController {
  final String _accessTokenKey = 'access_token';
  final String _profileDataKey = 'access_token';

  String? accessToken;
  User? profileModel;

  Future<void> saveUserDataAndAccessToken(String accessToken, User userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(_profileDataKey, jsonEncode(userModel.toJson()));
    profileModel = userModel;
  }

  Future<void> getUserDataAndAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    profileModel = User.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      await getUserDataAndAccessToken();
      return true;
    } else {
      return false;
    }
  }
    // Future<bool> isUserLoggedIn() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.containsKey(_accessTokenKey);
  // }

  Future<void> clearUserDataAndAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }


}