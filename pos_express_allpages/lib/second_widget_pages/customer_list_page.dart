import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 124, 212),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(backgroundColor: Colors.black),
          ),
        ),
      ),
    );
  }
}
