import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mycounterapp/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter app with provider"),
      ),
      body: Container(
        color: Color.fromARGB(255, 192, 234, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text(
                "Counter value is: ${value.counterValue.toString()}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0),
              );
            }),
            SizedBox(height: 15.0),
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      value.add();
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 20.0),
                  FloatingActionButton(
                    onPressed: () {
                      value.remove();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
