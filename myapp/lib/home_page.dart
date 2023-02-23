import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 160, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 3, 150),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          size: 40.0,
          color: Color.fromARGB(255, 253, 253, 252),
        ),
        title: Text(
          "This is AppBar",
          style: TextStyle(
              color: Color.fromARGB(255, 7, 236, 57),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.favorite,
            size: 40.0,
            color: Color.fromARGB(255, 255, 4, 4),
          ),
          Icon(
            Icons.phone,
            size: 40.0,
            color: Color.fromARGB(255, 4, 170, 93),
          ),
          Icon(
            Icons.menu,
            size: 40.0,
            color: Color.fromARGB(255, 7, 7, 7),
          ),
        ],
      ),
    );
  }
}
