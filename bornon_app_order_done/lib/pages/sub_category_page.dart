import 'package:bornon_app/api_models/category_apimodel.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/drawer_sections/common_end_drawerpage.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/model/product_list.dart';
import 'package:bornon_app/providers/counter_provider.dart';
import 'package:bornon_app/summery_sortdetails/short_details_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SubCategoryPage extends StatefulWidget {
  SubCategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryIndex,
  });
  final String categoryName;
  int categoryIndex;

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  int index = 0;
  late final Box box;
  CategoryApiModel? categoryApiModel;
  @override
  void initState() {
    CategoryApiModel? categoryApiModel;
    Provider.of<CounterProvider>(context, listen: false).getCategorys(context);
    setState(() {});
    super.initState();
    print(widget.categoryName);
    print(widget.categoryIndex);
    //print("length: ${categoryList[widget.categoryIndex]["pList"].length}");
    //print("${widget.categoryIndex]["pList"].lenth}");
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
    final myAll_categorydata =
        Provider.of<CounterProvider>(context).allcategorylistData;
    return Scaffold(
      endDrawer: CommonEndDrawerPage(),
      backgroundColor: Color.fromARGB(255, 127, 175, 214),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 99, 126),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            "${myAll_categorydata[widget.categoryIndex].name}",
            //widget.categoryName.toString(),
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10.0),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
              child: ShoppingCartBadge(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            // itemCount: myAll_categorydata[widget.categoryIndex]["sub_category"].length,
            //itemCount: myAll_categorydata[widget.categoryIndex]["product"].length,
            // itemCount: categoryList[widget.categoryIndex]["pList"].length,
            itemCount: myAll_categorydata[widget.categoryIndex].product!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 5 / 7),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ShortDetailsPage(
                      pImage:
                          "${myAll_categorydata[widget.categoryIndex].product![index].mainImage}",
                      pName:
                          "${myAll_categorydata[widget.categoryIndex].product![index].name}",
                      pPrice: myAll_categorydata[widget.categoryIndex]
                          .product![index]
                          .price!
                          .toInt(),
                      pQuantity: myAll_categorydata[widget.categoryIndex]
                          .product![index]
                          .quantity!,
                      pShortDetails:
                          "${myAll_categorydata[widget.categoryIndex].product![index].shortDetails}",
                      pCategoryId:
                          "${myAll_categorydata[widget.categoryIndex].product![index].categoryId}",
                      pDescription:
                          "${myAll_categorydata[widget.categoryIndex].product![index].description}",
                    );
                  })).then((_) => setState(() {}));
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 173, 171, 171),
                                      spreadRadius: 0.10,
                                      blurRadius: 0.0,
                                      offset: Offset(0.0, 0.1))
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "$imgUrl${myAll_categorydata[widget.categoryIndex].product![index].mainImage}",
                                    ),
                                    fit: BoxFit.fill),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 69, 56),
                                      radius: 18.0,
                                      child: Text(
                                        "25%",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            //color: Color.fromARGB(255, 235, 209, 209),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),
                                Text(
                                  myAll_categorydata[widget.categoryIndex]
                                      .product![index]
                                      .name
                                      .toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  myAll_categorydata[widget.categoryIndex]
                                      .product![index]
                                      .quantity
                                      .toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " ৳ ${myAll_categorydata[widget.categoryIndex].product![index].price}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.black,
                                      size: 12.0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}
