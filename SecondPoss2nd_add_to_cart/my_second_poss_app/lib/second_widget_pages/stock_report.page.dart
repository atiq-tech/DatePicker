import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

import '../models/product_list.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {
  bool isCategoryWiseClicked = false;
  bool isProductWiseClicked = false;
  String data = '';
  List<String> _types = [
    'Current Stock',
    'Total Stock',
    'Category Wise Stock',
    'Product Wise Stock'
  ];

  List<String> _category = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
  ];
  List<String> _product = [
    'P1',
    'P2',
    'P3',
    'P4',
    'P5',
    'P6',
    'P7',
  ];
  String? _selectedTypes;
  String? _selectedCategory;
  String? _selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Stock Report"),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 25.0, right: 20.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Type:",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      DropdownButton(
                        hint: Text(
                          'Please select a type',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ), // Not necessary for Option 1
                        value: _selectedTypes,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTypes = newValue!;
                            _selectedTypes == "Category Wise Stock"
                                ? isCategoryWiseClicked = true
                                : isCategoryWiseClicked = false;
                            _selectedTypes == "Product Wise Stock"
                                ? isProductWiseClicked = true
                                : isProductWiseClicked = false;
                          });
                        },
                        items: _types.map((location) {
                          return DropdownMenuItem(
                            child: Text(
                              location,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                isCategoryWiseClicked == true
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Category:",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            DropdownButton(
                              hint: Text(
                                'Please select a category',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ), // Not necessary for Option 1
                              value: _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategory = newValue!;
                                });
                              },
                              items: _category.map((location) {
                                return DropdownMenuItem(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                isProductWiseClicked == true
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Product",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            DropdownButton(
                              hint: Text(
                                "Please select a product",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              value: _selectedProduct,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedProduct = newValue!;
                                });
                              },
                              items: _product.map((location) {
                                return DropdownMenuItem(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      )
                    : Container(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTypes == "Current Stock"
                              ? data = 'current stock'
                              : _selectedTypes == "Total Stock"
                                  ? data = 'Total Stock'
                                  : _selectedTypes == "Category Wise Stock"
                                      ? data = "Category Wise Stock"
                                      : _selectedTypes == "Product Wise Stock"
                                          ? data = "Product Wise Stock"
                                          : data = '';
                        });
                      },
                      child: Container(
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 4, 113, 185),
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          "Show Report",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 92, 90, 90),
          ),
          Container(
            child: Column(
              children: [
                Text(data),
                Text(data),
                Text(data),
              ],
            ),
          )
        ],
      ),
    );
  }
}
