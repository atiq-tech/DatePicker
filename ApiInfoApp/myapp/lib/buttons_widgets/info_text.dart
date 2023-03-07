import 'package:flutter/material.dart';

class Infotext extends StatelessWidget {
  final text;
  const Infotext({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "${text}",
        style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 18.0),
      ),
    );
  }
}
