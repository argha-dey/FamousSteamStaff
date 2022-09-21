import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/servicedetail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ServicedetailApi {

  Future<dynamic> onservicedetailApi(String orderid, String lang) async {
    try {
      final uri = Uri.parse(Config.apiurl + Config.servicedetail + orderid);
      debugPrint("ServiceDetails uri:$uri");

      final response =
      await http.get(uri, headers: {
        'content-Type': 'application/json',
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      });

      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        log("ServiceDetails response:$responseJson");

        return ServicedetailModel.fromJson(responseJson);
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
