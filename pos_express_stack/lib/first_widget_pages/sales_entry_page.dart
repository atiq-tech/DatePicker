import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SalesEntryPage extends StatefulWidget {
  const SalesEntryPage({super.key});

  @override
  State<SalesEntryPage> createState() => _SalesEntryPageState();
}

class _SalesEntryPageState extends State<SalesEntryPage> {
  String lavel = "Retails";
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
          "Sales Entry",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              height: 175.0,
              width: double.infinity,
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 6.0, left: 15.0, right: 15.0),
                    child: Container(
                      height: 25.0,
                      width: double.infinity,
                      color: Color.fromARGB(255, 5, 114, 165),
                      child: Center(
                          child: Text(
                        "Sales Type",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.15,
                            child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromARGB(255, 5, 114, 165),
                                ),
                                value: "Retails",
                                groupValue: lavel,
                                onChanged: (value) {
                                  setState(() {
                                    lavel = value.toString();
                                  });
                                }),
                          ),
                          Text("Retails"),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.15,
                            child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromARGB(255, 5, 114, 165),
                                ),
                                value: "Wholesale",
                                groupValue: lavel,
                                onChanged: (value) {
                                  setState(() {
                                    lavel = value.toString();
                                  });
                                }),
                          ),
                          Text("Wholesale"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Customer",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
                          "Mobile Number",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
                          "Address",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
            SizedBox(height: 6.0),
            Container(
              height: 185.0,
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
                          height: 36.0,
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
                          "Available Stock",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
                          "Sales Rate",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
                          "Quantity",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 28.0,
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
    );
  }
}
