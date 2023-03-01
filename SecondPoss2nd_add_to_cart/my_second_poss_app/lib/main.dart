import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_second_poss_app/custom_bottom_navigation_bar.dart';
import 'package:my_second_poss_app/hive_model/item.dart';
import 'package:my_second_poss_app/hive_model/purchase_item.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(ItemDetailsAdapter());

  Hive.registerAdapter(PurchaseDetailsAdapter());
  // Opening the box
  await Hive.openBox('productBox');

  await Hive.openBox('purchaseBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Custom_Navigation_BarPage());
  }
}
