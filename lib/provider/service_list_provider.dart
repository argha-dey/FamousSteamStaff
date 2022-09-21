import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:famous_steam_staff/global/config.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/data_not_found.dart';
import 'package:famous_steam_staff/model/service_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ServicelistApi {
  Future<dynamic> onservicelistApi(String lang, String filterdate) async {
    try {
      final uri = Uri.parse(Config.apiurl + 'staff-order?request_type[]=approve&request_type[]=complete&from_date='+filterdate+'&to_date='+filterdate);

   //   https://carwash.developerconsole.link/api/staff-order?request_type[]=approve&request_type[]=pending&from_date=2022-07-30&to_date=2022-08-02
      https://carwash.developerconsole.link/api/staff-order?request_type=approve&from_date=""&to_date=""
      debugPrint("orderListUrl : $uri");
    //  dynamic postData = {'lang': lang, 'filter_date': filterdate};


    // debugPrint("serviceList req: $postData");

      Map<String, String>  requestHeaders = {
        'Accept-Language': '${PrefObj.preferences!.get(PrefKeys.LANG)}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${PrefObj.preferences!.get(PrefKeys.TOKEN)}'
      };
      final response = await http.get(uri, headers: requestHeaders);


      log("orderlist response : ${jsonDecode(response.body)}");




      dynamic responseJson;
      if (response.statusCode == 200) {
        return ServicelistModel.fromJson(jsonDecode(response.body));
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
