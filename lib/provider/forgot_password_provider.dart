import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/change_paswword_model.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/forgot_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordApi {
  Future<dynamic> onForgotPasswordApi(
      int mobileNumber) async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.forgotpassword);
      debugPrint("forgotPassword url: $uri");

      Map<String,dynamic>  requestPostData = <String, dynamic>{
        'mobile': mobileNumber
      };
      debugPrint("forgotPassword reqPostData: $requestPostData");
      Map<String, String>  requestHeaders = {
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      };
      final response = await http.post(uri, body: requestPostData, headers: requestHeaders);



      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
       // debugPrint("forgotPassword response : $responseJson");
        return ForgotPasswordModel.fromJson(responseJson);
      } else if (response.statusCode == 404) {
        responseJson = json.decode(response.body);
        return DataNotFoundModel.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      print('exception---- $exception');
      return null;
    }
  }
}
