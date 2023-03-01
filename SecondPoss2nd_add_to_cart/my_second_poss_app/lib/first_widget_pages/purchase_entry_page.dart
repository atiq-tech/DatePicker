import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
import 'package:my_second_poss_app/hive_model/item.dart';
import 'package:my_second_poss_app/hive_model/purchase_item.dart';

class PurchaseEntryPage extends StatefulWidget {
  const PurchaseEntryPage({super.key});

  @override
  State<PurchaseEntryPage> createState() => _PurchaseEntryPageState();
}

class _PurchaseEntryPageState extends State<PurchaseEntryPage> {
  //final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  //final TextEditingController _productController = TextEditingController();
  final TextEditingController _purchaseRateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();

  late final Box boxPE;

  double h1TextSize = 16.0;
  double h2TextSize = 14.0;

  @override
  void initState() {
    super.initState();
    boxPE = Hive.box('purchaseBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    boxPE.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  String dropdownSupplierValue = 'Ahmed Shezad';
  String dropdownProductValue = 'Motor cycle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Purchase Entry"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
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
                                value: dropdownSupplierValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownSupplierValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Ahmed Shezad',
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
                                  'Motor cycle',
                                  'Cap',
                                  'Motor bike',
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
                                controller: _purchaseRateController,
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
                                controller: _totalAmountController,
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
                                controller: _sellingPriceController,
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
                        child: InkWell(
                          onTap: () {
                            PurchaseDetails purchaseDetails = PurchaseDetails(
                                supplierName: dropdownSupplierValue,
                                mobileNumber:
                                    int.parse(_mobileNumberController.text),
                                addressName: _addressController.text,
                                productName: dropdownProductValue,
                                purchaseRate:
                                    int.parse(_purchaseRateController.text),
                                quantityValue:
                                    int.parse(_quantityController.text),
                                totalAmount:
                                    int.parse(_totalAmountController.text),
                                sellingPrice:
                                    int.parse(_sellingPriceController.text));
                            boxPE.add(purchaseDetails);
                            _mobileNumberController.text = '';
                            _addressController.text = '';
                            _purchaseRateController.text = '';
                            _quantityController.text = '';
                            _totalAmountController.text = '';
                            _sellingPriceController.text = '';
                          },
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
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 320.0,
                  width: double.infinity,
                  child: ValueListenableBuilder(
                    valueListenable: boxPE.listenable(),
                    builder: (context, Box boxPE, widget) {
                      if (boxPE.isEmpty) {
                        return Center(
                          child: Text('No Product in Cart'),
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: boxPE.length,
                                itemBuilder: (context, index) {
                                  var currentBox = boxPE;
                                  var purchaseitemData =
                                      currentBox.getAt(index)!;
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 6),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 2, 105, 150),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10.0))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Supplier:  ${purchaseitemData.supplierName}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: h1TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Phone No:  ${purchaseitemData.mobileNumber}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Address:  ${purchaseitemData.addressName}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Product:  ${purchaseitemData.productName}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Purchase Rate:  ${purchaseitemData.purchaseRate}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Quantity:  ${purchaseitemData.quantityValue}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Total Amount:  ${purchaseitemData.totalAmount}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Selling Price:  ${purchaseitemData.sellingPrice}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: h2TextSize,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: FloatingActionButton(
                                                      heroTag: null,
                                                      onPressed: () {
                                                        _deleteProduct(index);
                                                        setState(() {
                                                          boxPE.length;
                                                        });
                                                      },
                                                      mini: true,
                                                      shape:
                                                          const CircleBorder(),
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                            255, 3, 3, 3),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    },
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
