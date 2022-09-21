import 'dart:async';
import 'dart:convert';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/accept_reject_model.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AcceptRejectApi {
  Future<dynamic> onacceptRejectApi(String orderid, String status) async {
    try {
      final uri = Uri.parse(Config.apiurl +"staff-order-change-status");



      Map<String, String>  requestHeaders = {
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      };

      Map<String,dynamic>  requestPostData = <String, dynamic>{

        'order_id': orderid,
        'request_type': status,
      };

      final response = await http.post(uri, body:requestPostData,headers: requestHeaders);


      print("order chage  request : ${jsonEncode(requestPostData)}");
      print("order chage  response : ${jsonDecode(response.body)}");


      dynamic responseJson;
      if (response.statusCode == 200) {

        responseJson = json.decode(response.body);
        return AcceptRejectModel.fromJson(responseJson);
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
