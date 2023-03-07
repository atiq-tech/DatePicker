import 'dart:convert';
import 'package:http/http.dart' as http;

class IpData {
  static Future<String> getMyIpAddress() async {
    http.Response res =
        await http.get(Uri.parse("https://api.ipify.org/?format=json"));
    if (res.statusCode == 200) {
      print(jsonDecode(res.body)["ip"]);
      return jsonDecode(res.body)["ip"];
    }

    return "No data found";
  }
}
