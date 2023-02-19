import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/product_list.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70.0,
            width: double.infinity,
            color: Color.fromARGB(255, 50, 145, 223),
            padding: EdgeInsets.only(top: 30.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bankTransaction.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 40.0, right: 5.0),
                    child: Text(
                      "${bankTransaction[index]['name']}",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  );
                }),
          ),
          Container(
            height: 600.0,
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
