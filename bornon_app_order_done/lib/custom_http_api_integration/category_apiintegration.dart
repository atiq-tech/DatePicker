import 'dart:convert';

import 'package:bornon_app/api_models/category_apimodel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CategoryProduct {
  static GetCategoryApi(context) async {
    String Link = "https://bornonbd.com/api/category-with-subcategory";
    List<CategoryData> allcategorylistData = [];
    late CategoryData categoryData;
    try {
      var Response = await http.get(Uri.parse(Link));
      if (Response.statusCode == 200) {
        var data = jsonDecode(Response.body)["data"];
        print("====Categoryyyyyyyyyyyyyyyy===Apiiiiiiiiiiiiiiiii: ${data}");
        for (var i in data) {
          categoryData = CategoryData.fromJson(i);
          allcategorylistData.add(categoryData);
        }
      }
    } catch (e) {
      print("Wrong Category api plz cheeckkkkkkk:$e");
    }
    return allcategorylistData;
  }
}
