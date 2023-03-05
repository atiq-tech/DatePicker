import 'package:bornon_app/check_newArrival_api.dart';
import 'package:bornon_app/home_page.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/pages/category_page.dart';
import 'package:bornon_app/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(ProductDetailsAdapter());
  // Opening the box
  await Hive.openBox('productBox');
  runApp(const MyApp());
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      //home: ttttttttttttttttt(),
      home: HomePage(),
       
      ),
    );
  }
}
