import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:pos_express/common_widget/custom_appbar.dart';
import 'package:pos_express/models/product_list.dart';

class BankTransactionPage extends StatefulWidget {
  const BankTransactionPage({super.key});

  @override
  State<BankTransactionPage> createState() => _BankTransactionPageState();
}

class _BankTransactionPageState extends State<BankTransactionPage> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bank Transaction"),
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
                            controller: _DateController,
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
                                  _DateController.text =
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
                            controller: _accountController,
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
                            controller: _transactionTypeController,
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: 250.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            top: 15.0, left: 10.0, right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                "Select Item",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Icon(Icons.search,
                                                        size: 25.0,
                                                        color: Colors.blue)),
                                                Expanded(
                                                  flex: 5,
                                                  child: TextField(
                                                    decoration:
                                                        InputDecoration(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  _transactionTypeController
                                                      .text = "Deposit";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text("Deposit",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                )),
                                            SizedBox(height: 10.0),
                                            Divider(
                                              thickness: 1.0,
                                              color: Color.fromARGB(
                                                  255, 201, 198, 198),
                                            ),
                                            SizedBox(height: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  _transactionTypeController
                                                      .text = "Withdraw";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text("Withdraw",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                )),
                                            SizedBox(height: 20.0),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  width: 70.0,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 69, 218, 185),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child: Center(
                                                      child: Text(
                                                    "COLSE",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                            controller: _amountController,
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
                            controller: _noteController,
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
