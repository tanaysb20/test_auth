import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Urls/url.dart';

class AuthProvider with ChangeNotifier {
  Future<bool> login(String login, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${UrlStatus.baseUrl}${UrlStatus.login}");
    final response = await post(url,
        body: json.encode({"username": login, "password": password}),
        headers: headers);
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        "userToken",
        responseData["token"].toString(),
      );
      notifyListeners();
      return true;
    } else {
      print(responseData["error"]["message"]);
      print(responseData);
      EasyLoading.showError(
        responseData["error"]["message"],
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,

        // duration: Duration(seconds: 2),
      );

      return false;
    }
  }

  Future<String> getSchoolCode() async {
    var headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${UrlStatus.baseUrl}${UrlStatus.schoolcode}");
    final response = await post(url,
        headers: headers, body: json.encode({"name": "Prep247"}));
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      notifyListeners();
      return responseData[0]["schoolCode"].toString();
    } else {
      EasyLoading.showError(
        "Somwthing went wrong.Please try again later",
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,

        // duration: Duration(seconds: 2),
      );

      return "";
    }
  }

  Future<bool> signup(String name, String lastname, String email,
      String contactnumber, String password, String schoolCode) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse("${UrlStatus.baseUrl}${UrlStatus.signup}");
    final response = await post(url,
        body: json.encode({
          "name": name,
          "surname": lastname,
          "email": email,
          "section": 'default',
          "role": 'student',
          "contactNumber": contactnumber,
          "password": password,
          "schoolCode": schoolCode
        }),
        headers: headers);
    final responseData = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        "userToken",
        responseData["token"].toString(),
      );
      notifyListeners();
      return true;
    } else {
      EasyLoading.showError(
        responseData["error"]["message"],
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,

        // duration: Duration(seconds: 2),
      );

      return false;
    }
  }
}
