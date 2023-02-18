import 'package:flutter/material.dart';
import 'package:pos_express/first_widget_pages/bank_transaction_page.dart';
import 'package:pos_express/first_widget_pages/cash_transaction.dart';
import 'package:pos_express/first_widget_pages/customer_entry.page.dart';
import 'package:pos_express/first_widget_pages/customer_pay_reciev_page.dart';
import 'package:pos_express/first_widget_pages/purchase_entry_page.dart';
import 'package:pos_express/first_widget_pages/sales_entry_page.dart';
import 'package:pos_express/first_widget_pages/supplier_payment_page.dart';
import 'package:pos_express/home_page.dart';
import 'package:pos_express/login_page/log_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SupplierPaymentPage(),
      //home: BankTransactionPage(),
      //home: CashTransactionPage(),
      //home: CustomerPayRecivePage(),
      //home: CustomerEntryPage(),
      //home: PurchaseEntryPage(),
      //home: SalesEntryPage(),
      //home: HomePage(),
      //home: LogInPage(),
    );
  }
}
