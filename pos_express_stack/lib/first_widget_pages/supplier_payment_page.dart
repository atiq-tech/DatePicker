import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class SupplierPaymentPage extends StatefulWidget {
  const SupplierPaymentPage({super.key});

  @override
  State<SupplierPaymentPage> createState() => _SupplierPaymentPageState();
}

class _SupplierPaymentPageState extends State<SupplierPaymentPage> {
  TextEditingController _paymentDate = TextEditingController();

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
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 22.0,
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 7, 125, 180),
        title: Text(
          "Supplier Payment",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 125, 180),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: DropdownButton<String>(
                              value: dropdownValues,
                              items: listitem.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromARGB(255, 2, 73, 180)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValues = newValue ?? '';
                                });
                              },
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 125, 180),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              items: items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromARGB(255, 2, 73, 180)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue ?? '';
                                });
                              },
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
                            controller: _paymentDate,
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
                                  _paymentDate.text =
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
