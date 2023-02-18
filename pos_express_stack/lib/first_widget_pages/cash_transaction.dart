import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:pos_express/models/product_list.dart';

class CashTransactionPage extends StatefulWidget {
  const CashTransactionPage({super.key});

  @override
  State<CashTransactionPage> createState() => _CashTransactionPageState();
}

class _CashTransactionPageState extends State<CashTransactionPage> {
  TextEditingController _Date = TextEditingController();
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
          "Cash Transaction",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            child: Container(
              height: 225.0,
              width: double.infinity,
              padding: EdgeInsets.only(top: 6.0, left: 10.0, right: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 5, 107, 155),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Transaction Type",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: Container(
                          height: 28.0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(top: 6.0, left: 5.0),
                                child: Text(
                                  "Cash Receive",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color.fromARGB(255, 2, 73, 180)),
                                ),
                              ),
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: 160.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Payment Cash/Receive"),
                                            SizedBox(height: 10.0),
                                            TextField(
                                              decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search)),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text("Receive"),
                                            SizedBox(height: 10.0),
                                            Text("Cash"),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 11,
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
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
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
                        flex: 5,
                        child: Text(
                          "Date",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: Container(
                          height: 35.0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            controller: _Date,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                size: 20.0,
                              ),
                              suffixIconColor: Color.fromARGB(255, 3, 95, 216),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));
                              if (pickdate != null) {
                                setState(() {
                                  _Date.text =
                                      DateFormat("yyyy-MM-dd").format(pickdate);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 11,
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
                        flex: 5,
                        child: Text(
                          "Amount",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                      ),
                      Expanded(
                        flex: 11,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 35.0,
                        width: 85.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 88, 204, 91),
                              width: 2.0),
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
                      SizedBox(width: 4.0),
                      Container(
                        height: 35.0,
                        width: 85.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 88, 204, 91),
                              width: 2.0),
                          color: Color.fromARGB(255, 252, 33, 4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: Text(
                          "CANCEL",
                          style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: double.infinity,
            color: Colors.blue,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cashTransaction.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 45.0, right: 5.0),
                    child: Text(
                      "${cashTransaction[index]['name']}",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
