import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
import 'package:my_second_poss_app/models/product_list.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product List"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: double.infinity,
              child: CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/p5.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //2nd Image of Slider
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/p4.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //3rd Image of Slider
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/p10.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //4th Image of Slider
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/p9.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  //enlargeCenterPage: true,
                  autoPlay: true,

                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
            ),
            Container(
              height: 500.0,
              width: double.infinity,
              color: Color.fromARGB(255, 249, 253, 255),
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: myProductslist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 4 / 5,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 182, 180, 180),
                              offset: Offset(1.0, 1.0),
                              spreadRadius: 5.0,
                              blurRadius: 10.0)
                        ], borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${myProductslist[index]["image"]}"),
                                          fit: BoxFit.cover),
                                      color: Color.fromARGB(255, 103, 4, 128),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 224, 222, 222),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15.0),
                                      Text(
                                        "Brand: ${myProductslist[index]["name"]}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      SizedBox(height: 15.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Price:\$1500",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 94, 92, 92)),
                                          ),
                                          Text(
                                            "❤️",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
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
