import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class SalesEntryPage extends StatefulWidget {
  const SalesEntryPage({super.key});

  @override
  State<SalesEntryPage> createState() => _SalesEntryPageState();
}

class _SalesEntryPageState extends State<SalesEntryPage> {
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _availableStockController =
      TextEditingController();
  final TextEditingController _salesRateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _items = [];
  final _shoppingBox = Hive.box('shopping_box');

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key);
      return {
        "key": key,
        "name": item["name"],
        "address": item["address"],
        "phone": item["phone"],
        "product": item["product"],
      };
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  String lavel = "Retails";
  String dropdownCustomerValue = 'Atiq';
  String dropdownProductValue = 'Mango';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Entry"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
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
                                      (states) =>
                                          Color.fromARGB(255, 5, 114, 165),
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
                                      (states) =>
                                          Color.fromARGB(255, 5, 114, 165),
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
                              height: 30.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 5.0, left: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 90, 149, 238)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 77, 137, 226)),
                                  ),
                                  filled: true,
                                ),
                                dropdownColor: Colors.greenAccent,
                                value: dropdownCustomerValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownCustomerValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Atiq',
                                  'Nitish',
                                  'Maruf',
                                  'Mehedi',
                                  'Nahid',
                                  'Nuzmul',
                                  'Joy',
                                  'Musha'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  );
                                }).toList(),
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
                                controller: _mobileNumberController,
                                keyboardType: TextInputType.phone,
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
                                controller: _addressController,
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
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 5.0, left: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 90, 149, 238)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 77, 137, 226)),
                                  ),
                                  filled: true,
                                ),
                                dropdownColor: Colors.greenAccent,
                                value: dropdownProductValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownProductValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Mango',
                                  'Cap',
                                  'Banana',
                                  'Umbrella',
                                  'Bike',
                                  'Car',
                                  'Cycle',
                                  'Spider'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  );
                                }).toList(),
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
                                controller: _availableStockController,
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
                                controller: _salesRateController,
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
                                controller: _quantityController,
                                keyboardType: TextInputType.number,
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
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
