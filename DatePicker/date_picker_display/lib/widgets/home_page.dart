import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DatePicker in Textfield"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.calendar_today_rounded,
              ),
              suffixIconColor: Color.fromARGB(255, 28, 5, 236),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 5, color: Color.fromARGB(255, 202, 5, 143)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.greenAccent),
              ),
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickeddate != null) {
                setState(() {
                  _dateController.text =
                      DateFormat("yyyy-MM-dd").format(pickeddate);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
