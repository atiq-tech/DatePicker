import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Customer List"),
      // body: Container(
      //     padding: EdgeInsets.all(15),
      //     child: Table(
      //       border: TableBorder.all(width: 1.0, color: Colors.black45),
      //       columnWidths: {
      //         0: FlexColumnWidth(1),
      //         1: FlexColumnWidth(3),
      //         2: FlexColumnWidth(3),
      //         3: FlexColumnWidth(2),
      //         4: FlexColumnWidth(3),
      //       }, //table border
      //       children: const [
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("SI"))),
      //           TableCell(child: Text("Customer Id")),
      //           TableCell(child: Text("Customer Name")),
      //           TableCell(child: Text("Address")),
      //           TableCell(child: Text("Contact No."))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("1."))),
      //           TableCell(child: Text("Krishna Karki")),
      //           TableCell(child: Text("Nepal, Kathmandu")),
      //           TableCell(child: Text("Nepal")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("2."))),
      //           TableCell(child: Text("John Wick")),
      //           TableCell(child: Text("New York, USA")),
      //           TableCell(child: Text("USA")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("3."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("4."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("5."))),
      //           TableCell(child: Text("Krishna Karki")),
      //           TableCell(child: Text("Nepal, Kathmandu")),
      //           TableCell(child: Text("Nepal")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("6."))),
      //           TableCell(child: Text("John Wick")),
      //           TableCell(child: Text("New York, USA")),
      //           TableCell(child: Text("USA")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("7."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("8."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("9."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("10."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("11."))),
      //           TableCell(child: Text("Krishna Karki")),
      //           TableCell(child: Text("Nepal, Kathmandu")),
      //           TableCell(child: Text("Nepal")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("12."))),
      //           TableCell(child: Text("John Wick")),
      //           TableCell(child: Text("New York, USA")),
      //           TableCell(child: Text("USA")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("13."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("14."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("15."))),
      //           TableCell(child: Text("Krishna Karki")),
      //           TableCell(child: Text("Nepal, Kathmandu")),
      //           TableCell(child: Text("Nepal")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("16."))),
      //           TableCell(child: Text("John Wick")),
      //           TableCell(child: Text("New York, USA")),
      //           TableCell(child: Text("USA")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("17."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("18."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("19."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //         TableRow(children: [
      //           TableCell(child: Center(child: Text("20."))),
      //           TableCell(child: Text("Fedrick May")),
      //           TableCell(child: Text("Berlin, Germany")),
      //           TableCell(child: Text("Germany")),
      //           TableCell(child: Text("+667655832"))
      //         ]),
      //       ],
      //     )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: AdaptiveScrollbar(
          underColor: Colors.blueGrey.withOpacity(0.3),
          sliderDefaultColor: Colors.grey.withOpacity(0.7),
          sliderActiveColor: Colors.grey,
          controller: _verticalScrollController,
          child: AdaptiveScrollbar(
            controller: _horizontalScrollController,
            position: ScrollbarPosition.bottom,
            underColor: Colors.blueGrey.withOpacity(0.3),
            sliderDefaultColor: Colors.grey.withOpacity(0.7),
            sliderActiveColor: Colors.grey,
            child: SingleChildScrollView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 16.0),
                  child: DataTable(
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                        label: Center(child: Text('SI')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Customer Id')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Customer Name')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Address')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Contact No.')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      20,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Center(child: Text('Row $index')),
                          ),
                          DataCell(
                            Center(child: Text('Row $index')),
                          ),
                          DataCell(
                            Center(child: Text('Row $index')),
                          ),
                          DataCell(
                            Center(child: Text('Row $index')),
                          ),
                          DataCell(
                            Center(child: Text('Row $index')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
