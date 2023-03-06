import 'dart:convert';

import 'package:bornon_app/api_models/new_arrival_model.dart';
import 'package:http/http.dart' as http;

//New Arrival Products Request
class NewArrivalProduct {
  static GetNewArrivalData(context) async {
    String Link = "https://bornonbd.com/api/newarrival";
    List<Data> allnewArrivalData = [];
    late Data dataa;
    try {
      var Response = await http.get(Uri.parse(Link));
      if (Response.statusCode == 200) {
        var data = jsonDecode(Response.body)["data"];
        print("Sob Gulo Data amake diye dew taratari : ${data}");
        for (var i in data) {
          dataa = Data.fromJson(i);
          allnewArrivalData.add(dataa);
        }
      }
    } catch (e) {
      print("Error amr vhul hocee amay khoma kori den:$e");
    }
    return allnewArrivalData;
  }

}
