import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_poss_app/drawer_section/mydrawersection.dart';
import 'package:my_second_poss_app/first_widget_pages/bank_transaction_page.dart';
import 'package:my_second_poss_app/first_widget_pages/cash_transaction.dart';
import 'package:my_second_poss_app/first_widget_pages/customer_entry.page.dart';
import 'package:my_second_poss_app/first_widget_pages/customer_pay_reciev_page.dart';
import 'package:my_second_poss_app/first_widget_pages/purchase_entry_page.dart';
import 'package:my_second_poss_app/first_widget_pages/sales_entry_page.dart';
import 'package:my_second_poss_app/first_widget_pages/supplier_payment_page.dart';
import 'package:my_second_poss_app/models/product_list.dart';
import 'package:my_second_poss_app/second_widget_pages/custom_due_list_page.dart';
import 'package:my_second_poss_app/second_widget_pages/customer_list_page.dart';
import 'package:my_second_poss_app/second_widget_pages/product_list_page.dart';
import 'package:my_second_poss_app/second_widget_pages/sales_reports.dart';
import 'package:my_second_poss_app/second_widget_pages/setting_page.dart';
import 'package:my_second_poss_app/second_widget_pages/stock_report.page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    SalesEntryPage(),
    PurchaseEntryPage(),
    CustomerEntryPage(),
    CustomerPayRecivePage(),
    CashTransactionPage(),
    BankTransactionPage(),
    SupplierPaymentPage(),
  ];
  List _secondPages = [
    CustomDueList(),
    SalesReport(),
    ProductListPage(),
    StockReportPage(),
    CustomerListPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerSection(),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color.fromARGB(255, 7, 125, 180),
        title: Text(
          "POS EXPRESS",
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        actions: [
          Column(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "Welcome,Admin",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 7, 125, 180),
                      height: 160.0,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 60, left: 10, right: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                        child: ListView.separated(
                          separatorBuilder: (_, index) => SizedBox(width: 6.0),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: headTitle.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.0,
                              width: 85,
                              margin: EdgeInsets.only(
                                right: 4,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${headTitle[index]['name']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "105k",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 253, 253, 253),
                                  borderRadius: BorderRadius.circular(5.0)),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 145,
                    ),
                    Center(
                      child: Text(
                        maxLines: 1,
                        "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 136, 139, 141)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 6, 113, 163),
                        ),
                      ),
                    ),
                    Container(
                      height: 230.0,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: GridView.builder(
                          itemCount: SecondProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 2.0,
                                  crossAxisSpacing: 2.0,
                                  childAspectRatio: 4 / 4),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => _secondPages[
                                          index])); // index er maddhome pages gula niye ashlam
                                });
                              },
                              child: Card(
                                elevation: 9.00,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "${SecondProducts[index]['image']}",
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "${SecondProducts[index]['name']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 7, 125, 180),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              left: 10,
              top: MediaQuery.of(context).size.height / 7 + 4,
              child: Container(
                height: 190.0,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    itemCount: firstProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 0.2,
                        crossAxisSpacing: 0.2,
                        childAspectRatio: 4 / 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => _pages[index]));
                          });
                        },
                        child: Card(
                          elevation: 9.00,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${firstProducts[index]['image']}",
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "${firstProducts[index]['name']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
