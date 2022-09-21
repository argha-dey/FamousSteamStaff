import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/change_paswword_model.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ResetPasswordApi {
  Future<dynamic> onResetPasswordApi(
      String oldpassword, String newpassword, String confirmpassword) async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.changepassword);
      debugPrint("resetPassword url: $uri");
      dynamic postData = {
        'old_password': oldpassword,
        'new_password': newpassword,
        'confirm_password': confirmpassword
      };
      debugPrint("resetPassword req: $postData");
      final response = await http.post(
        uri,
        body: json.encode(postData),
        headers: {
          'content-Type': 'application/json',
          'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
        },
      );

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        debugPrint("resetPassword response : $responseJson");
        return ResetPaswwordModel.fromJson(responseJson);
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
