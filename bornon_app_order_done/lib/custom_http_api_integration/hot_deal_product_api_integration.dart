import 'dart:convert';

import 'package:bornon_app/api_models/hotdeal_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HotDealProduct {
  static GetHotDealApi(context) async {
    String Link = "https://bornonbd.com/api/hot-deal-product";
    List<HotDealProductModel> allHotDealData = [];
    late HotDealProductModel hotDealProductModel;
    try {
      var Response = await http.get(Uri.parse(Link));
      if (Response.statusCode == 200) {
        var data = jsonDecode(Response.body)["data"]["data"];
        print(
            "HOOOOOOOOOOOT DEAL ER Sob Gulo Data amake diye dew taratari : ${data}");
        for (var i in data) {
          hotDealProductModel = HotDealProductModel.fromJson(i);
          allHotDealData.add(hotDealProductModel);
        }
      }
    } catch (e) {
      print("Amar kache hoooooooot dddeal data naaaaaaai errrrrrrrrrorss:$e");
    }
    return allHotDealData;
  }
}
