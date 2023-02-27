import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class CustomDueList extends StatefulWidget {
  const CustomDueList({super.key});

  @override
  State<CustomDueList> createState() => _CustomDueListState();
}

class _CustomDueListState extends State<CustomDueList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Custom Due List"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700.0,
              width: double.infinity,
              color: Color.fromARGB(255, 156, 213, 247),
              padding: EdgeInsets.all(5.0),
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 4 / 3,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Customer Name:Atiq",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              "Amount:25,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              "Due Amount:12,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
