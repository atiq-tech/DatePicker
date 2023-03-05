import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bornon_app/api_models/product_model.dart';
import 'package:bornon_app/custom_http_api_integration/allproduct_apiintegration.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/carousel/carousel_items.dart';
import 'package:bornon_app/custom_http_api_integration/newarrival_api_intregration.dart';
import 'package:bornon_app/drawer_sections/common_drawer.dart';
import 'package:bornon_app/drawer_sections/common_end_drawerpage.dart';
import 'package:bornon_app/drawer_sections/drawer_items.dart';
import 'package:bornon_app/drawer_sections/my_orders_page.dart';
import 'package:bornon_app/itemlist_headfooter/item_List_part.dart';
import 'package:bornon_app/model/itemlistpart.model.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/model/product_list.dart';
import 'package:bornon_app/pages/allproduct_page.dart';
import 'package:bornon_app/pages/category_page.dart';
import 'package:bornon_app/pages/login_page.dart';
import 'package:bornon_app/providers/counter_provider.dart';
import 'package:bornon_app/row_seeall/see_all_section.dart';
import 'package:bornon_app/summery_sortdetails/order_summery_page.dart';
import 'package:bornon_app/summery_sortdetails/short_details_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'custom_http_api_integration/hot_deal_product_api_integration.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Mydata = ItemListPartModel.generatedMySourecList();
  int isClick = 1;

  late final Box box;

  ApiallProduct? apiallproduct;
  HotDealProduct? hotdealproduct;
  NewArrivalProduct? newArrivalProduct;
  @override
  void initState() {
    ApiallProduct? apiallproduct;
    Provider.of<CounterProvider>(context, listen: false).getProduct(context);
    //
    HotDealProduct? hotdealproduct;
    Provider.of<CounterProvider>(context, listen: false).getHotdeal(context);
    //
    NewArrivalProduct? newArrivalProduct;
    Provider.of<CounterProvider>(context, listen: false).getNewArrival(context);

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
//All Product
    final myAll_productdata =
        Provider.of<CounterProvider>(context).allProductlistData;
//Hot deal
    final myHotDeal_data = Provider.of<CounterProvider>(context).allHotDealData;
//NEW Arrival
    final myNewArrival_data =
        Provider.of<CounterProvider>(context).allnewArrivalData;
    return SafeArea(
      child: Scaffold(
        drawer: CommonDrawerPage(),
        endDrawer: CommonEndDrawerPage(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: const Color.fromARGB(235, 51, 56, 66),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Center(
                  child: Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            title: const Text("Bornon"),
            actions: const [
              Icon(Icons.search),
              SizedBox(width: 10.0),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
                child: ShoppingCartBadge(),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselItems(),
              SizedBox(height: 20.0),
              ItemListPart(Mydata: Mydata),
              SizedBox(height: 20.0),
              SeeAllSection(seetitleText: "Hot Deal", seeAllText: "See all"),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: myHotDeal_data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      print("=========length:${myHotDeal_data.length}");
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ShortDetailsPage(
                                pImage: "${myHotDeal_data[index].mainImage}",
                                pName: "${myHotDeal_data[index].name}",
                                pPrice: myHotDeal_data[index].price!,
                                pQuantity: myHotDeal_data[index].quantity!,
                                pShortDetails:
                                    "${myHotDeal_data[index].shortDetails}",
                                pCategoryId:
                                    "${myHotDeal_data[index].categoryId}",
                                pDescription:
                                    "${myHotDeal_data[index].description}",
                              );
                            })).then((_) => setState(() {}));
                          });
                        },
                        child: Container(
                          width: 110.0,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                spreadRadius: 3.0,
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 231, 227, 227),
                                offset: Offset(3.0, 3.0)),
                          ], color: Color.fromARGB(255, 255, 255, 255)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "$imgUrl${myHotDeal_data[index].mainImage}",
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Color.fromARGB(255, 145, 11, 122),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.0),
                                      Text(
                                        "${myHotDeal_data[index].name}",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 31, 30, 30),
                                            fontSize: 12.0),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "${myHotDeal_data[index].price}",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 8, 117, 241),
                                            fontSize: 14.0),
                                      ),
                                      const SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          bool found = false;
                                          setState(() {
                                            box.length;
                                            for (int i = 0;
                                                i < box.length;
                                                i++) {
                                              ProductDetails existingProduct =
                                                  box.getAt(i);
                                              if (existingProduct.productName ==
                                                      myHotDeal_data[index]
                                                          .name &&
                                                  existingProduct
                                                          .productPrice ==
                                                      myHotDeal_data[index]
                                                          .price) {
                                                existingProduct
                                                        .productQuantity =
                                                    myHotDeal_data[index]
                                                            .quantity! +
                                                        1;
                                                //.quantity!+i;
                                                //.quantity!+index;
                                                //.quantity!++;
                                                box.putAt(i, existingProduct);
                                                found = true;
                                                break;
                                              }
                                            }
                                            if (!found) {
                                              //ProductDetails holo hive er Model class name
                                              ProductDetails productDetails =
                                                  ProductDetails(
                                                      productName:
                                                          myHotDeal_data[index]
                                                              .name
                                                              .toString(),
                                                      productPrice:
                                                          myHotDeal_data[index]
                                                              .price!,
                                                      productQuantity:
                                                          myHotDeal_data[index]
                                                              .quantity!,
                                                      productImage:
                                                          myHotDeal_data[index]
                                                              .mainImage!);
                                              box.add(productDetails);
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color:
                                              Color.fromARGB(255, 13, 124, 16),
                                          child: Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 233, 229, 229),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(width: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              SeeAllSection(seetitleText: "New Arrival", seeAllText: "See all"),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 180.0,
                  width: double.infinity,
                  //color: Color.fromARGB(255, 209, 129, 247),
                  child: myNewArrival_data == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemCount: myNewArrival_data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            print(
                                "=====NewArrival====length:${myNewArrival_data.length}");
                            return InkWell(
                              onTap: () async {
                                setState(() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ShortDetailsPage(
                                      pImage:
                                          "${myNewArrival_data[index].mainImage}",
                                      pName: "${myNewArrival_data[index].name}",
                                      pPrice: myNewArrival_data[index].price!,
                                      pQuantity:
                                          myNewArrival_data[index].quantity!,
                                      pShortDetails:
                                          "${myNewArrival_data[index].shortDetails}",
                                      pCategoryId:
                                          "${myNewArrival_data[index].categoryId}",
                                      pDescription:
                                          "${myNewArrival_data[index].description}",
                                    );
                                  })).then((_) => setState(() {}));
                                });
                              },
                              child: Container(
                                width: 130.0,
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(3.0),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0,
                                        color:
                                            Color.fromARGB(255, 231, 227, 227),
                                        offset: Offset(3.0, 3.0)),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3.0),
                                                topRight: Radius.circular(3.0)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "$imgUrl${myNewArrival_data[index].mainImage}",
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        // color: Color.fromARGB(255, 145, 11, 122),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20.0),
                                            Text(
                                              "${myNewArrival_data[index].name}",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 31, 30, 30),
                                                  fontSize: 12.0),
                                            ),
                                            SizedBox(height: 5.0),
                                            Text(
                                              "${myNewArrival_data[index].price}",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 8, 117, 241),
                                                  fontSize: 14.0),
                                            ),
                                            SizedBox(height: 10.0),
                                            InkWell(
                                              onTap: () {
                                                bool found = false;
                                                setState(() {
                                                  box.length;
                                                  for (int i = 0;
                                                      i < box.length;
                                                      i++) {
                                                    ProductDetails
                                                        existingProduct =
                                                        box.getAt(i);
                                                    if (existingProduct
                                                                .productName ==
                                                            myNewArrival_data[
                                                                    index]
                                                                .name &&
                                                        existingProduct
                                                                .productPrice ==
                                                            myNewArrival_data[
                                                                    index]
                                                                .price) {
                                                      existingProduct
                                                              .productQuantity =
                                                          myNewArrival_data[
                                                                      index]
                                                                  .quantity! +
                                                              1;
                                                      box.putAt(
                                                          i, existingProduct);

                                                      found = true;
                                                      break;
                                                    }
                                                  }
                                                  if (!found) {
                                                    //ProductDetails holo hive er Model class name
                                                    ProductDetails
                                                        productDetails =
                                                        ProductDetails(
                                                            productName:
                                                                myNewArrival_data[
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                            productPrice:
                                                                myNewArrival_data[
                                                                        index]
                                                                    .price!,
                                                            productQuantity:
                                                                myNewArrival_data[
                                                                        index]
                                                                    .quantity!,
                                                            productImage:
                                                                myNewArrival_data[
                                                                        index]
                                                                    .mainImage!);
                                                    box.add(productDetails);
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: Color.fromARGB(
                                                    255, 13, 124, 16),
                                                child: Center(
                                                  child: Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 233, 229, 229),
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, index) => SizedBox(width: 15.0),
                        ),
                ),
              ),
              SizedBox(height: 15.0),
              SeeAllSection(seetitleText: "All Product", seeAllText: ""),
              SizedBox(height: 20.0),

              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Consumer<CounterProvider>(
                    builder: (context, provider, child) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: myAll_productdata.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 7 / 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ShortDetailsPage(
                                  pImage:
                                      "${myAll_productdata[index].mainImage}",
                                  pName: "${myAll_productdata[index].name}",
                                  pPrice: myAll_productdata[index].price!,
                                  pQuantity: myAll_productdata[index].quantity!,
                                  pShortDetails:
                                      "${myAll_productdata[index].shortDetails}",
                                  pCategoryId:
                                      "${myAll_productdata[index].categoryId}",
                                  pDescription:
                                      "${myAll_productdata[index].description}",
                                );
                              })).then((_) => setState(() {}));
                            });
                          },
                          child: Container(
                            width: 110.0,
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(3.0),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 3.0,
                                    blurRadius: 10.0,
                                    color: Color.fromARGB(255, 231, 227, 227),
                                    offset: Offset(3.0, 3.0)),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(3.0),
                                            topRight: Radius.circular(3.0)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "$imgUrl${myAll_productdata[index].mainImage}"),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    // color: Color.fromARGB(255, 145, 11, 122),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.0),
                                        Text(
                                          "${myAll_productdata[index].name}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 31, 30, 30),
                                              fontSize: 10.0),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Price: ${myAll_productdata[index].price}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 42, 43, 44),
                                              fontSize: 12.0),
                                        ),
                                        SizedBox(height: 10.0),
                                        InkWell(
                                          onTap: () {
                                            bool found = false;
                                            setState(() {
                                              box.length;
                                              for (int i = 0;
                                                  i < box.length;
                                                  i++) {
                                                ProductDetails existingProduct =
                                                    box.getAt(i);
                                                if (existingProduct
                                                            .productName ==
                                                        myAll_productdata[index]
                                                            .name &&
                                                    existingProduct
                                                            .productPrice ==
                                                        myAll_productdata[index]
                                                            .price) {
                                                  existingProduct
                                                          .productQuantity =
                                                      myAll_productdata[index]
                                                              .quantity! +
                                                          1;
                                                  //.quantity!+i;
                                                  //.quantity!+index;
                                                  //.quantity!++;
                                                  box.putAt(i, existingProduct);

                                                  found = true;
                                                  break;
                                                }
                                              }
                                              if (!found) {
                                                //ProductDetails holo hive er Model class name
                                                ProductDetails productDetails =
                                                    ProductDetails(
                                                        productName:
                                                            myAll_productdata[
                                                                    index]
                                                                .name
                                                                .toString(),
                                                        productPrice:
                                                            myAll_productdata[
                                                                    index]
                                                                .price!,
                                                        productQuantity:
                                                            myAll_productdata[
                                                                    index]
                                                                .quantity!,
                                                        productImage:
                                                            myAll_productdata[
                                                                    index]
                                                                .mainImage!);
                                                box.add(productDetails);
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Color.fromARGB(
                                                255, 75, 143, 79),
                                            child: Center(
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromARGB(
                                                        255, 233, 229, 229),
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),

              // Padding(
              //   padding: EdgeInsets.only(left: 10.0, right: 10.0),
              //   child: FutureBuilder(
              //       future: _futureData,
              //       builder: (context, snapshot) {
              //         if (snapshot.hasError) {
              //           return Text("Error:${snapshot.error}");
              //         }
              //         if (snapshot.hasData) {
              //           List<ProductModel> allProductlistData =
              //               snapshot.data ?? [];
              //           return GridView.builder(
              //               shrinkWrap: true,
              //               physics: NeverScrollableScrollPhysics(),
              //               itemCount: allProductlistData.length,
              //               gridDelegate:
              //                   SliverGridDelegateWithFixedCrossAxisCount(
              //                       crossAxisCount: 3,
              //                       mainAxisSpacing: 10.0,
              //                       crossAxisSpacing: 10.0,
              //                       childAspectRatio: 7 / 10),
              //               itemBuilder: (context, index) {
              //                 return InkWell(
              //                   onTap: () async {
              //                     setState(() {
              //                       Navigator.of(context).push(
              //                           MaterialPageRoute(builder: (context) {
              //                         return ShortDetailsPage(
              //                           pImage:
              //                               "${allProductlistData[index].mainImage}",
              //                           pName:
              //                               "${allProductlistData[index].name}",
              //                           pPrice:
              //                               allProductlistData[index].price!,
              //                           pQuantity:
              //                               allProductlistData[index].quantity!,
              //                           pShortDetails:
              //                               "${allProductlistData[index].shortDetails}",
              //                           pCategoryId:
              //                               "${allProductlistData[index].categoryId}",
              //                           pDescription:
              //                               "${allProductlistData[index].description}",
              //                         );
              //                       })).then((_) => setState(() {}));
              //                     });
              //                   },
              //                   child: Container(
              //                     width: 110.0,
              //                     padding:
              //                         EdgeInsets.only(left: 10.0, right: 10.0),
              //                     decoration: BoxDecoration(
              //                       color: Color.fromARGB(255, 255, 255, 255),
              //                       borderRadius: BorderRadius.circular(3.0),
              //                       boxShadow: [
              //                         BoxShadow(
              //                             spreadRadius: 3.0,
              //                             blurRadius: 10.0,
              //                             color: Color.fromARGB(
              //                                 255, 231, 227, 227),
              //                             offset: Offset(3.0, 3.0)),
              //                       ],
              //                     ),
              //                     child: Column(
              //                       children: [
              //                         Expanded(
              //                           flex: 2,
              //                           child: Container(
              //                             decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.only(
              //                                     topLeft: Radius.circular(3.0),
              //                                     topRight:
              //                                         Radius.circular(3.0)),
              //                                 image: DecorationImage(
              //                                     image: NetworkImage(
              //                                         "$imgUrl${allProductlistData[index].mainImage}"),
              //                                     fit: BoxFit.fill)),
              //                           ),
              //                         ),
              //                         Expanded(
              //                           flex: 3,
              //                           child: Container(
              //                             // color: Color.fromARGB(255, 145, 11, 122),
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 SizedBox(height: 20.0),
              //                                 Text(
              //                                   "${allProductlistData[index].name}",
              //                                   style: TextStyle(
              //                                       color: Color.fromARGB(
              //                                           255, 31, 30, 30),
              //                                       fontSize: 10.0),
              //                                 ),
              //                                 SizedBox(height: 5.0),
              //                                 Text(
              //                                   "Price: ${allProductlistData[index].price}",
              //                                   style: TextStyle(
              //                                       color: Color.fromARGB(
              //                                           255, 42, 43, 44),
              //                                       fontSize: 12.0),
              //                                 ),
              //                                 SizedBox(height: 10.0),
              //                                 InkWell(
              //                                   onTap: () {
              //                                     bool found = false;
              //                                     setState(() {
              //                                       box.length;
              //                                       for (int i = 0;
              //                                           i < box.length;
              //                                           i++) {
              //                                         ProductDetails
              //                                             existingProduct =
              //                                             box.getAt(i);
              //                                         if (existingProduct
              //                                                     .productName ==
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .name &&
              //                                             existingProduct
              //                                                     .productPrice ==
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .price) {
              //                                           existingProduct
              //                                                   .productQuantity =
              //                                               allProductlistData[
              //                                                           index]
              //                                                       .quantity! +
              //                                                   1;
              //                                           //.quantity!+i;
              //                                           //.quantity!+index;
              //                                           //.quantity!++;
              //                                           box.putAt(
              //                                               i, existingProduct);

              //                                           found = true;
              //                                           break;
              //                                         }
              //                                       }
              //                                       if (!found) {
              //                                         //ProductDetails holo hive er Model class name
              //                                         ProductDetails productDetails = ProductDetails(
              //                                             productName:
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .name
              //                                                     .toString(),
              //                                             productPrice:
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .price!,
              //                                             productQuantity:
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .quantity!,
              //                                             productImage:
              //                                                 allProductlistData[
              //                                                         index]
              //                                                     .mainImage!);
              //                                         box.add(productDetails);
              //                                       }
              //                                     });
              //                                   },
              //                                   child: Container(
              //                                     height: MediaQuery.of(context)
              //                                             .size
              //                                             .height /
              //                                         30,
              //                                     width: MediaQuery.of(context)
              //                                         .size
              //                                         .width,
              //                                     color: Color.fromARGB(
              //                                         255, 75, 143, 79),
              //                                     child: Center(
              //                                       child: Text(
              //                                         "Add to cart",
              //                                         style: TextStyle(
              //                                             fontWeight:
              //                                                 FontWeight.w600,
              //                                             color: Color.fromARGB(
              //                                                 255,
              //                                                 233,
              //                                                 229,
              //                                                 229),
              //                                             fontSize: 16.0),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               });
              //         }
              //         return Center(
              //             child: CircularProgressIndicator(
              //                 color: Color.fromARGB(255, 186, 5, 202)));
              //       }),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: CommonBtmNbBar(),
      ),
    );
  }
}

//   Drawer CommonEndDrawerPage() {
//     return Drawer(
//         child: ValueListenableBuilder(
//           valueListenable: box.listenable(),
//           builder: (context, Box box, widget) {
//             if (box.isEmpty) {
//               return Center(
//                 child: AnimatedTextKit(
//                   animatedTexts: [
//                     ScaleAnimatedText(
//                         "    No items in Cart,\nPlease add items in Cart",
//                         textStyle: const TextStyle(
//                           fontSize: 18.0,
//                           fontFamily: "MonteCarlo",
//                           color: Color.fromARGB(255, 3, 143, 66),
//                         )),
//                   ],
//                 ),
//               );
//             } else {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 25.0),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 200.0),
//                       child: InkWell(
//                           onTap: () {
//                             box.clear();
//                             setState(() {});
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 "Delete cart",
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 32, 155, 255),
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Icon(
//                                 Icons.delete,
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                                 size: 18.0,
//                               ),
//                             ],
//                           )),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: box.length,
//                         itemBuilder: (context, index) {
//                           var currentBox = box;
//                           var productData = currentBox.getAt(index)!;

//                           return Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, right: 10.0, bottom: 5.0),
//                             child: Card(
//                               elevation: 8,
//                               color: const Color.fromARGB(255, 84, 129, 182),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Container(
//                                         width: MediaQuery.of(context)
//                                                 .size
//                                                 .width /
//                                             8,
//                                         height: MediaQuery.of(context)
//                                                 .size
//                                                 .height /
//                                             16,
//                                         padding: const EdgeInsets.only(
//                                             left: 5.0, right: 5.0),
//                                         decoration: const BoxDecoration(
//                                           color: Color.fromARGB(
//                                               255, 196, 3, 202),
//                                         ),
//                                         child: Image.network(
//                                           "$imgUrl${productData.productImage}",
//                                           fit: BoxFit.fill,
//                                         )),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "${productData.productName}",
//                                           style: const TextStyle(
//                                               color: Color.fromARGB(
//                                                   255, 0, 0, 0),
//                                               fontSize: 14.0,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                         Text(
//                                           "Price:${productData.productPrice}",
//                                           style: const TextStyle(
//                                               color: Color.fromARGB(
//                                                   255, 46, 51, 51),
//                                               fontSize: 14.0,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         Text(
//                                           "Quantity:${productData.productQuantity}",
//                                           style: const TextStyle(
//                                               color: Color.fromARGB(
//                                                   255, 0, 0, 0),
//                                               fontSize: 14.0,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   if (productData
//                                                           .productQuantity >
//                                                       1) {
//                                                     productData
//                                                         .productQuantity--;

//                                                     ProductDetails
//                                                         existingProduct =
//                                                         box.getAt(index);

//                                                     existingProduct
//                                                             .productQuantity =
//                                                         productData
//                                                             .productQuantity--;

//                                                     box.putAt(index,
//                                                         existingProduct);
//                                                   }
//                                                 });
//                                               },
//                                               child: Container(
//                                                 width: 25.0,
//                                                 height: 25.0,
//                                                 decoration: BoxDecoration(
//                                                     color:
//                                                         const Color.fromARGB(
//                                                             255, 66, 91, 117),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             50.0)),
//                                                 child: const Icon(
//                                                   Icons.remove,
//                                                   color: Color.fromARGB(
//                                                       255, 212, 209, 209),
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(width: 10.0),
//                                             Text(
//                                               "${productData.productQuantity}",
//                                               style: const TextStyle(
//                                                   color: Color.fromARGB(
//                                                       255, 28, 28, 29),
//                                                   fontSize: 14.0,
//                                                   fontWeight:
//                                                       FontWeight.w700),
//                                             ),
//                                             const SizedBox(width: 10.0),
//                                             InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   productData
//                                                       .productQuantity++;

//                                                   ProductDetails
//                                                       existingProduct =
//                                                       box.getAt(index);

//                                                   existingProduct
//                                                           .productQuantity =
//                                                       productData
//                                                           .productQuantity++;

//                                                   box.putAt(
//                                                       index, existingProduct);
//                                                 });
//                                               },
//                                               child: Container(
//                                                 width: 25.0,
//                                                 height: 25.0,
//                                                 decoration: BoxDecoration(
//                                                     color:
//                                                         const Color.fromARGB(
//                                                             255, 66, 91, 117),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             50.0)),
//                                                 child: const Icon(
//                                                   Icons.add,
//                                                   color: Color.fromARGB(
//                                                       255, 212, 209, 209),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Container(
//                                           width: 25.0,
//                                           height: 25.0,
//                                           decoration: BoxDecoration(
//                                               color: const Color.fromARGB(
//                                                   255, 66, 91, 117),
//                                               borderRadius:
//                                                   BorderRadius.circular(4.0)),
//                                           child: InkWell(
//                                             onTap: () {
//                                               _deleteProduct(index);
//                                               setState(() {
//                                                 box.length;
//                                                 print(box.length);
//                                               });
//                                             },
//                                             child: const Icon(
//                                               Icons.delete,
//                                               color: Color.fromARGB(
//                                                   255, 212, 209, 209),
//                                               size: 20.0,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           height: 100,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               num totalPrice = 0;
//                               for (int i = 0; i < box.length; i++) {
//                                 var productData = box.getAt(i)!;

//                                 totalPrice += productData.productPrice *
//                                     productData.productQuantity;
//                               }
//                               return Center(
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "Total Price: \$ ${totalPrice.toString()}.00",
//                                       style: const TextStyle(
//                                           fontSize: 25,
//                                           color: Color.fromARGB(255, 0, 0, 0),
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               Navigator.of(context).push(
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           OrderSummeryPage(
//                                                             checkoutPage:
//                                                                 "card",
//                                                           )));
//                                             });
//                                           },
//                                           child: const Text("Order Here")),
//                                     )
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ))
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       );
//   }}
