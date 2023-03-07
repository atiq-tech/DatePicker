import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/buttons_widgets/info_text.dart';
import 'package:myapp/buttons_widgets/info_title_text.dart';
import 'package:myapp/buttons_widgets/my_button.dart';
import 'package:myapp/data/ip_info_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff0F0817),
            image: DecorationImage(image: AssetImage("assets/flash2.png")),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/begimg.png",
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                    ),
                    fillColor: Color(0xff1E133E),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myButton(
                      text: "My IP",
                      icon: Image.asset(
                        "assets/my_ip.png",
                        width: 30.0,
                      ),
                      onPressed: () async => await IpData.getMyIpAddress()),
                  SizedBox(
                    width: 20.0,
                  ),
                  myButton(
                      text: "Get Info",
                      icon: Image.asset(
                        "assets/get_info.png",
                        width: 30.0,
                      ),
                      onPressed: () {
                        print(" 2nd function");
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    Text(
                      "Information About The IP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "192.167.98.63",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoTitletext(
                          text: "City",
                        ),
                        InfoTitletext(
                          text: "Region",
                        ),
                        InfoTitletext(
                          text: "Country",
                        ),
                        InfoTitletext(
                          text: "Lat and Long",
                        ),
                        InfoTitletext(
                          text: "Operator",
                        ),
                        InfoTitletext(
                          text: "Postal Code",
                        ),
                        InfoTitletext(
                          text: "Time Zone",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Infotext(
                            text: "City",
                          ),
                          Infotext(
                            text: "Region",
                          ),
                          Infotext(
                            text: "Country",
                          ),
                          Infotext(
                            text: "Lat and Long",
                          ),
                          Infotext(
                            text: "Operator",
                          ),
                          Infotext(
                            text: "Postal Code",
                          ),
                          Infotext(
                            text: "Time Zone",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
