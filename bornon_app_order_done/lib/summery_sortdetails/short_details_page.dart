import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/drawer_sections/common_end_drawerpage.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/size/size_items.dart';
import 'package:bornon_app/summery_sortdetails/order_summery_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShortDetailsPage extends StatefulWidget {
  ShortDetailsPage({
    super.key,
    required this.pPrice,
    required this.pName,
    required this.pImage,
    required this.pQuantity,
    required this.pShortDetails,
    required this.pCategoryId,
    required this.pDescription,
  });
  final String pName, pImage;
  final int pPrice;
  int pQuantity;
  final String pShortDetails;
  final String pCategoryId;
  final String pDescription;
  @override
  State<ShortDetailsPage> createState() => _ShortDetailsPageState();
}

class _ShortDetailsPageState extends State<ShortDetailsPage> {
  final sizedata = SizeItems.generatedMySourecList();
  late final Box box;

  @override
  void initState() {
    super.initState();
    print(widget.pName);
    print(widget.pImage);
    print(widget.pPrice);
    print(widget.pQuantity);
    print(widget.pShortDetails);
    print(widget.pCategoryId);
    print(widget.pDescription);

    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  final mySize = SizeItems.generatedMySourecList();
  int isPress = 1;
  int quantity = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CommonEndDrawerPage(),
        backgroundColor: Color.fromARGB(255, 198, 250, 239),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 82, 88, 100),
            title: Text("Bornon"),
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        height: 300.0,
                        width: 270.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 177, 12, 163),
                          image: DecorationImage(
                              image: NetworkImage(
                                "$imgUrl${widget.pImage}",
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Container(
                        height: 300.0,
                        width: 85.0,
                        //color: Color.fromARGB(255, 247, 99, 234),
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 50,
                                height: 70,
                                margin:
                                    const EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "$imgUrl${widget.pImage}"),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) =>
                                SizedBox(height: 10.0),
                            itemCount: 6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      widget.pName,
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.pQuantity > 1
                              ? widget.pQuantity--
                              : widget.pQuantity;
                        });
                      },
                      child: Container(
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 14.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      widget.pQuantity.toString(),
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.pQuantity > 0
                              ? widget.pQuantity++
                              : widget.pQuantity;
                        });
                      },
                      child: Container(
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 14.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Short Details:",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 1.0,
                  width: 150.0,
                  color: Colors.black,
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${widget.pShortDetails}",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    Text(
                      "Price:",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "৳ ${widget.pPrice.toString()}",
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 43, 42, 42),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      "Category id: ",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.pCategoryId}",
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 43, 42, 42),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  "❤️ Add to wishlist",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      "Color:",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 20.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30.0)),
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Text(
                      "Size:",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 40.0,
                      width: 180.0,
                      padding: EdgeInsets.all(5.0),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: sizedata.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                isPress = index;
                              });
                            },
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  color: isPress == index
                                      ? const Color.fromARGB(255, 223, 13, 94)
                                      : const Color.fromARGB(
                                          255, 238, 113, 154),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Center(
                                child: Text(
                                  "${mySize[index].T_shirt_size}",
                                  style: GoogleFonts.roboto(
                                      color: isPress == index
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 5, 110, 197),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => const SizedBox(
                          width: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Description: ${widget.pDescription}",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderSummeryPage(
                                      checkoutPage: "ShortDetailsPage",
                                      productName: widget.pName,
                                      productPrice: widget.pPrice,
                                      productQuantity: widget.pQuantity,
                                      productSubTotalPrice:
                                          widget.pPrice * widget.pQuantity,
                                      productTotalPrice:
                                          widget.pPrice * widget.pQuantity,
                                    )));
                          });
                        },
                        child: Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                color: Color.fromARGB(255, 24, 125, 240)),
                            child: Center(
                              child: Text(
                                "Check out",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                      const SizedBox(width: 10.0),
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            setState(() {
                              Scaffold.of(context).openEndDrawer();
                              bool found = false;
                              for (int i = 0; i < box.length; i++) {
                                ProductDetails existingProduct = box.getAt(i);
                                if (existingProduct.productName ==
                                        widget.pName &&
                                    existingProduct.productPrice ==
                                        widget.pPrice) {
                                  existingProduct.productQuantity =
                                      widget.pQuantity;
                                  box.putAt(i, existingProduct);
                                  found = true;
                                  break;
                                }
                              }
                              if (!found) {
                                ProductDetails productDetails = ProductDetails(
                                    productName: widget.pName,
                                    productPrice: widget.pPrice,
                                    productQuantity: widget.pQuantity,
                                    productImage: widget.pImage);
                                box.add(productDetails);
                              }
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                color: Color.fromARGB(255, 189, 199, 95)),
                            child: Center(
                              child: Text(
                                "Add To Cart",
                                style: GoogleFonts.roboto(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CommonBtmNbBar(),
      ),
    );
  }
}
