import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:pos_express/models/product_list.dart';

class BankTransactionPage extends StatefulWidget {
  const BankTransactionPage({super.key});

  @override
  State<BankTransactionPage> createState() => _BankTransactionPageState();
}

class _BankTransactionPageState extends State<BankTransactionPage> {
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
          "Bank Transaction",
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
                                  "Deposit",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromARGB(255, 2, 70, 158)),
                                ),
                              ),
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: 220.0,
                                        width: double.infinity,
                                        color: Colors.white,
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              child: Text(
                                                "Select Item",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Icon(
                                                      Icons.search,
                                                      color: Color.fromARGB(
                                                          255, 3, 133, 240),
                                                    )),
                                                Expanded(
                                                  flex: 3,
                                                  child: TextField(
                                                    decoration:
                                                        InputDecoration(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  top: 15.0),
                                              child: Text("Withdraw"),
                                            ),
                                            Divider(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  top: 15.0),
                                              child: Text("Deposit"),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  width: 65.0,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 55, 209, 176),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child: Center(
                                                      child: Text(
                                                    "CLOSE",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.0),
                                                  )),
                                                ),
                                              ),
                                            ),
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
                  SizedBox(height: 3.0),
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
                          "Note",
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 35.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 131, 224, 146),
                            width: 2.0),
                        color: Color.fromARGB(255, 5, 114, 165),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: Text(
                        "SAVE TRANSACTIONS",
                        style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3.0),
          Container(
            height: 40.0,
            width: double.infinity,
            color: Colors.blue,
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
        ],
      ),
    );
  }
}
