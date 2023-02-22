import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mypos/common_widget/custom_appbar.dart';

import '../models/product_list.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {
  final TextEditingController _customerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Stock"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Type",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _customerController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 7, 125, 180), width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 7, 125, 180), width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 35.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 105, 190),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                        child: Text(
                      "Show Report",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
