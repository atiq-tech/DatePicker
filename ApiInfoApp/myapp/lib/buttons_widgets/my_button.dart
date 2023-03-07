import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String text;
  final Image icon;
  final onPressed;
  const myButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color(0xff886AE2),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Row(
          children: [
            Text(
              "$text",
              style: TextStyle(
                  color: Color(
                    0xff481E71,
                  ),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(width: 10.0),
            icon
          ],
        ),
      ),
    );
  }
}
