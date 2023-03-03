import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:statemanagemant_provider/providers/count_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountProvider>(
      create: (context) => CountProvider(),
      child: HomePageUI(title: title),
    );
  }
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed the button this many times",
                style: Theme.of(context).textTheme.headline6),
            Consumer<CountProvider>(
                builder: (_, value, __) => Text("${value.counter}",
                    style: Theme.of(context).textTheme.headline4))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CountProvider>(context, listen: false).increase(),
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
