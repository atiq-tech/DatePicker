import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String lavel = "Beginer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Radio Button"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                  value: "Beginer",
                  groupValue: lavel,
                  onChanged: (value) {
                    setState(() {
                      lavel = value.toString();
                    });
                  }),
              Text("Retails"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "Advance",
                  groupValue: lavel,
                  onChanged: (value) {
                    setState(() {
                      lavel = value.toString();
                    });
                  }),
              Text("Component"),
            ],
          ),
        ],
      ),
    );
  }
}
