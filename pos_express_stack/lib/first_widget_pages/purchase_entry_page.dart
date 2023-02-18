import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PurchaseEntryPage extends StatefulWidget {
  const PurchaseEntryPage({super.key});

  @override
  State<PurchaseEntryPage> createState() => _PurchaseEntryPageState();
}

class _PurchaseEntryPageState extends State<PurchaseEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 22.0,
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 7, 125, 180),
        title: Text(
          "Purchase Entry",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 110.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Supplier",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Mobile Number",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 220.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Product",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Purchase Rate",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.only(top: 5.0, left: 5.0),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Total Amount",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Selling Price",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 35.0,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 118, 170),
                          border: Border.all(
                              color: Color.fromARGB(255, 98, 236, 103),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
