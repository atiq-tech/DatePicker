import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Setting"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.link_outlined),
                prefixIconColor: Color.fromARGB(255, 69, 103, 250),
                label: Text("Enter Your Url"),
                hintText: "Enter Your Url",
                hintStyle: TextStyle(fontSize: 18.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 134, 132, 132)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromARGB(255, 2, 78, 165)),
                ),
              ),
              onTap: () async {},
            ),
            SizedBox(height: 20.0),
            Container(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 88, 204, 91), width: 2.0),
                color: Color.fromARGB(255, 5, 114, 165),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: Text(
                "SAVE",
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
