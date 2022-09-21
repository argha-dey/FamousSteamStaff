import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/get_staff_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetstaffAPI {
  Future<dynamic> onGetstaffAPI() async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.getstaff);
      debugPrint("onGetstaff url : $uri");
      final response = await http.get(uri, headers: {
     //   'content-Type': 'application/json',
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}',
      });
      print("getstaff response : ${jsonDecode(response.body)}");
      dynamic responseJson;
      if (response.statusCode == 200) {
        return GetstaffModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 403) {
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
