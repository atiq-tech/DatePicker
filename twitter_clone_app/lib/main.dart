import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 150, 197, 235),
          centerTitle: true,
          title: const Text(
            'Twitter Clone App',
            style: TextStyle(
                color: Color.fromARGB(255, 94, 2, 117),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
