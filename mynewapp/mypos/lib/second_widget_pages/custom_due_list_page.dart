import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mypos/common_widget/custom_appbar.dart';
import 'package:mypos/models/product_list.dart';

class CustomDueList extends StatefulWidget {
  const CustomDueList({super.key});

  @override
  State<CustomDueList> createState() => _CustomDueListState();
}

class _CustomDueListState extends State<CustomDueList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Custom Due List"),
      body: Column(
        children: [
          Container(
            height: 40.0,
            width: double.infinity,
            color: Color.fromARGB(255, 7, 125, 180),
            //padding: EdgeInsets.only(left: 10.0, right: 15.0),
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
