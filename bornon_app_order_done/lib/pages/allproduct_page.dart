import 'dart:convert';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:bornon_app/api_models/product_model.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/custom_http_api_integration/allproduct_apiintegration.dart';
import 'package:bornon_app/drawer_sections/common_drawer.dart';
import 'package:bornon_app/drawer_sections/common_end_drawerpage.dart';
import 'package:bornon_app/drawer_sections/drawer_items.dart';
import 'package:bornon_app/drawer_sections/my_orders_page.dart';
import 'package:bornon_app/home_page.dart';
import 'package:bornon_app/loading/loading_indicator.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/model/product_list.dart';
import 'package:bornon_app/pages/category_page.dart';
import 'package:bornon_app/pages/login_page.dart';
import 'package:bornon_app/providers/counter_provider.dart';
import 'package:bornon_app/summery_sortdetails/order_summery_page.dart';
import 'package:bornon_app/summery_sortdetails/short_details_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({
    super.key,
  });

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  late final Box box;

  ApiallProduct? apiallproduct;
  @override
  void initState() {
    ApiallProduct? apiallproduct;
    Provider.of<CounterProvider>(context, listen: false).getProduct(context);
    super.initState();
    setState(() {});
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    //AllProduct
    final myAll_productdata =
        Provider.of<CounterProvider>(context).allProductlistData;
    return SafeArea(
      child: Scaffold(
        drawer: CommonDrawerPage(),
        endDrawer: CommonEndDrawerPage(),
        backgroundColor: Color.fromARGB(255, 151, 185, 236),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 108, 131, 165),
            elevation: 3.0,
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Center(
                  child: Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 252, 249, 249),
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            title: Text(
              "All Product",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 252, 249, 249)),
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
              itemCount: myAll_productdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 5 / 7),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ShortDetailsPage(
                          pImage: "${myAll_productdata[index].mainImage}",
                          pName: "${myAll_productdata[index].name}",
                          pPrice: myAll_productdata[index].price!,
                          pQuantity: myAll_productdata[index].quantity!,
                          pShortDetails:
                              "${myAll_productdata[index].shortDetails}",
                          pCategoryId: "${myAll_productdata[index].categoryId}",
                          pDescription:
                              "${myAll_productdata[index].description}",
                        );
                      })).then((_) => setState(() {}));
                    });
                  },
                  child: Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                            color: Color.fromARGB(255, 137, 181, 250),
                            spreadRadius: 5,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.1)),
                      ],
                    ),
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 173, 171, 171),
                                          spreadRadius: 0.10,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.1))
                                    ],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "$imgUrl${myAll_productdata[index].mainImage}"),
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
                              flex: 2,
                              child: Container(
                                //color: Color.fromARGB(255, 235, 209, 209),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.0),
                                    Text(
                                      "${myAll_productdata[index].name}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " ৳ ${myAll_productdata[index].price}",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: Color.fromARGB(255, 0, 0, 0),
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
                  ),
                );
              }),
        ),
        bottomNavigationBar: CommonBtmNbBar(),
      ),
    );
  }
}
