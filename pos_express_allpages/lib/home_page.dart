import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_express/drawer_section/mydrawersection.dart';
import 'package:pos_express/first_widget_pages/bank_transaction_page.dart';
import 'package:pos_express/first_widget_pages/cash_transaction.dart';
import 'package:pos_express/first_widget_pages/customer_entry.page.dart';
import 'package:pos_express/first_widget_pages/customer_pay_reciev_page.dart';
import 'package:pos_express/first_widget_pages/purchase_entry_page.dart';
import 'package:pos_express/first_widget_pages/sales_entry_page.dart';
import 'package:pos_express/first_widget_pages/supplier_payment_page.dart';
import 'package:pos_express/login_page/log_in_page.dart';
import 'package:pos_express/models/product_list.dart';
import 'package:pos_express/second_widget_pages/custom_due_list_page.dart';
import 'package:pos_express/second_widget_pages/customer_list_page.dart';
import 'package:pos_express/second_widget_pages/product_list_page.dart';
import 'package:pos_express/second_widget_pages/sales_reports.dart';
import 'package:pos_express/second_widget_pages/setting_page.dart';
import 'package:pos_express/second_widget_pages/stock_report.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 7, 125, 180),
                  height: 160.0,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: ListView.separated(
                  separatorBuilder: (_, index) => SizedBox(width: 6.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  //itemCount: headTitle.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 4 - 6,
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
                  }),
            ),
          ),
          Positioned(
            top: 120.0,
            child: Container(
              height: 190.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: firstProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
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
          Positioned(
            bottom: 340.0,
            left: 170.0,
            child: Text(
              "Reports",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 7, 125, 180),
              ),
            ),
          ),
          Center(
            child: Text(
              "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 136, 139, 141)),
            ),
          ),
          Positioned(
            bottom: 100.0,
            child: Container(
              height: 230.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: SecondProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

