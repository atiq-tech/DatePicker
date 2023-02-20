import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:pos_express/common_widget/custom_appbar.dart';

class SupplierPaymentPage extends StatefulWidget {
  const SupplierPaymentPage({super.key});

  @override
  State<SupplierPaymentPage> createState() => _SupplierPaymentPageState();
}

class _SupplierPaymentPageState extends State<SupplierPaymentPage> {
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _paymentTypeController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _DuoController = TextEditingController();
  final TextEditingController _paymentDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  List<String> listitem = [
    'Receive',
    'Payment',
  ];
  String dropdownValues = 'Payment';

  List<String> items = [
    'Cash',
    'Bank',
  ];
  String dropdownValue = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Supplier Payment"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            child: Container(
              height: 300.0,
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
                            controller: _transactionTypeController,
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: 65.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  _transactionTypeController
                                                      .text = "Receive";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text("Receive",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 91, 153),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            SizedBox(height: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  _transactionTypeController
                                                      .text = "Payment";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text("Payment",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 17, 99, 167),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400))),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                            Text(
                              "Type",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: Container(
                          height: 28.0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            controller: _paymentTypeController,
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        height: 65.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  _paymentTypeController.text =
                                                      "Cash";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text("Cash",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 91, 153),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            SizedBox(height: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  _paymentTypeController.text =
                                                      "Bank";
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text("Bank",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 17, 99, 167),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400))),
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
                          "Supplier",
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
                          "Duo",
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
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Payment Date",
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
                            controller: _paymentDateController,
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
                                  _paymentDateController.text =
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
            padding: EdgeInsets.only(left: 15.0, right: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Supplier Id",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Supplier Name",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      "Contact Person",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Contact Number",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
