import 'dart:convert';

import 'package:bornon_app/api_models/product_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiallProduct {
  static GetApiData(context) async {
    String Link = "https://bornonbd.com/api/product";
    List<ProductModel> allProductlistData = [];
    late ProductModel productModel;
    try {
      var Response = await http.get(Uri.parse(Link));
      if (Response.statusCode == 200) {
        var data = jsonDecode(Response.body)["data"];
        print("Sob Gulo Data amake diye dew taratari : ${data}");
        for (var i in data) {
          productModel = ProductModel.fromJson(i);
          allProductlistData.add(productModel);
        }
      }
    } catch (e) {
      print("Error amr vhul hocee amay khoma kori den:$e");
    }
    return allProductlistData;
  }
}
