import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveItem extends StatefulWidget {
  const HiveItem({super.key});

  @override
  _HiveItemState createState() => _HiveItemState();
}

class _HiveItemState extends State<HiveItem> {
  late final Box box;
  double h1TextSize = 16.0;
  double totalPrice = 0;
  double shippingFee = 60;
  double h2TextSize = 14.0;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Color.fromARGB(255, 87, 117, 133),
        title: Text('Cart Info'),
        actions: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 231, 113, 139),
                    ),
                    onPressed: () {
                      box.clear();
                    },
                    child: Text("Delete all"),
                  )))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('No Product in Cart'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      var currentBox = box;
                      var itemData = currentBox.getAt(index)!;
                      return Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[100],
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${itemData.customerName}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: h1TextSize,
                                            ),
                                          ),
                                          Text(
                                                "${itemData.mobile}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: h2TextSize,
                                                ),
                                              ),
                                          Text(
                                            "${itemData.address}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: h2TextSize,
                                            ),
                                          ),
                                           Text(
                                            "${itemData.product}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: h2TextSize,
                                            ),
                                          ),
                                           Text(
                                            "${itemData.stock}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: h2TextSize,
                                            ),
                                          ),
                                          Text(
                                            "${itemData.salseRate}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: h2TextSize,
                                            ),
                                          ),
                                          Text(
                                            "${itemData.quantity}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: h2TextSize,
                                            ),
                                          ),
                                           
                                        
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.white,
                                        child: FloatingActionButton(
                                          heroTag: null,
                                          onPressed: () {
                                            _deleteProduct(index);
                                            setState(() {
                                              box.length;
                                            });
                                          },
                                          mini: true,
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                                255, 231, 113, 139),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
