import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_express/login_page/log_in_page.dart';
import 'package:pos_express/models/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 190.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 7, 125, 180),
                  image: DecorationImage(
                      image: AssetImage("assets/dwr.jpg"), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 209, 233, 240)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "http://mother.expressretailbd.com",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                height: 45.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 14.0, left: 15.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 7, 125, 180),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 10.0),
                                child: Text(
                                  "Logout...!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 10.0),
                                child: Text(
                                  "Are You Sure Went To Log Out?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LogInPage()));
                                    },
                                    child: Container(
                                      height: 40.0,
                                      width: 65.0,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 55, 209, 176),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Center(
                                          child: Text(
                                        "YES",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40.0,
                                      width: 65.0,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 55, 209, 176),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Center(
                                          child: Text(
                                        "NO",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0),
                                      )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                      // return Center(
                      //   child: Container(
                      //     height: 200.0,
                      //     width: double.infinity,
                      //     color: Color.fromARGB(255, 205, 238, 238),
                      //     child: Column(
                      //       children: [
                      //         Text(
                      //           "Logout...!",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w500,
                      //               fontSize: 18.0),
                      //         ),
                      //         Text(
                      //           "Are You Sure Went To Log Out?",
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 16.0),
                      //         ),
                      //         Row(
                      //           children: [
                      //             Container(
                      //               height: 70.0,
                      //               width: 100.0,
                      //               color: Color.fromARGB(255, 42, 211, 160),
                      //               child: Center(child: Text("YES")),
                      //             )
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                    });
              },
              child: Container(
                height: 45.0,
                width: double.infinity,
                color: Color.fromARGB(255, 224, 221, 221),
                padding: EdgeInsets.only(top: 14.0, left: 15.0),
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 7, 125, 180),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color.fromARGB(255, 7, 125, 180),
        title: Text(
          "POS EXPRESS",
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 7, 125, 180),
                  height: 160.0,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          Positioned(
            right: 110.0,
            top: 10.0,
            child: Text(
              "Welcome,Admin",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Positioned(
            right: 10.0,
            top: 10.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
            ),
          ),
          Positioned(
            top: 70.0,
            child: Container(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: ListView.separated(
                  separatorBuilder: (_, index) => SizedBox(width: 6.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  //itemCount: headTitle.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 35.0,
                      width: MediaQuery.of(context).size.width / 4 - 6,
                      child: Text(
                        "${headTitle[index]['name']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 125, 180),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 253, 253, 253),
                          borderRadius: BorderRadius.circular(5.0)),
                    );
                  }),
            ),
          ),
          Positioned(
            top: 120.0,
            child: Container(
              height: 190.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: firstProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 4 / 4),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${firstProducts[index]['image']}",
                            width: 35,
                            height: 35,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "${firstProducts[index]['name']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 125, 180),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 340.0,
            left: 170.0,
            child: Text(
              "Reports",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 7, 125, 180),
              ),
            ),
          ),
          Center(
            child: Text(
              "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 136, 139, 141)),
            ),
          ),
          Positioned(
            bottom: 100.0,
            child: Container(
              height: 230.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: SecondProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      childAspectRatio: 4 / 4),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "${SecondProducts[index]['image']}",
                            width: 35,
                            height: 35,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "${SecondProducts[index]['name']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 125, 180),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),

      // body: Stack(
      //   children: [
      //     Column(
      //       children: [
      //         Container(
      //           height: 160.0,
      //           width: double.infinity,
      //           color: Color.fromARGB(255, 7, 125, 180),
      //           child: Stack(children: [
      //             Positioned(
      //               right: 110.0,
      //               top: 10.0,
      //               child: Text(
      //                 "Welcome,Admin",
      //                 style: TextStyle(
      //                     fontSize: 16.0,
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.white),
      //               ),
      //             ),
      //             Positioned(
      //               right: 10.0,
      //               top: 10.0,
      //               child: CircleAvatar(
      //                 radius: 20.0,
      //                 backgroundImage: NetworkImage(
      //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
      //               ),
      //             ),
      //             Positioned(
      //               top: 70.0,
      //               child: Container(
      //                 height: 35.0,
      //                 width: MediaQuery.of(context).size.width,
      //                 padding: EdgeInsets.symmetric(horizontal: 3.0),
      //                 child: ListView.separated(
      //                     separatorBuilder: (_, index) => SizedBox(width: 6.0),
      //                     scrollDirection: Axis.horizontal,
      //                     shrinkWrap: true,
      //                     itemCount: 4,
      //                     //itemCount: headTitle.length,
      //                     itemBuilder: (context, index) {
      //                       return Container(
      //                         height: 35.0,
      //                         width: MediaQuery.of(context).size.width / 4 - 6,
      //                         child: Text(
      //                           "${headTitle[index]['name']}",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                             color: Color.fromARGB(255, 7, 125, 180),
      //                           ),
      //                         ),
      //                         decoration: BoxDecoration(
      //                             color: Color.fromARGB(255, 253, 253, 253),
      //                             borderRadius: BorderRadius.circular(5.0)),
      //                       );
      //                     }),
      //               ),
      //             ),
      //           ]),
      //         ),
      //         Positioned(
      //           top: 110.0,
      //           child: Container(
      //             height: 190.0,
      //             width: double.infinity,
      //             color: Color.fromARGB(255, 255, 255, 255),
      //             child: GridView.builder(
      //                 itemCount: firstProducts.length,
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: 4,
      //                     mainAxisSpacing: 2.0,
      //                     crossAxisSpacing: 2.0,
      //                     childAspectRatio: 4 / 4),
      //                 itemBuilder: (context, index) {
      //                   return Card(
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Image.asset(
      //                           "${firstProducts[index]['image']}",
      //                           width: 35,
      //                           height: 35,
      //                         ),
      //                         SizedBox(height: 10.0),
      //                         Text(
      //                           "${firstProducts[index]['name']}",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                             color: Color.fromARGB(255, 7, 125, 180),
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   );
      //                 }),
      //           ),
      //         ),
      //         SizedBox(height: 10.0),
      //         Text(
      //           "Reports",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w600,
      //             color: Color.fromARGB(255, 7, 125, 180),
      //           ),
      //         ),
      //         Text(
      //           "- - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - -",
      //           style: TextStyle(
      //               fontSize: 20.0, color: Color.fromARGB(255, 136, 139, 141)),
      //         ),
      //         Container(
      //           height: 230.0,
      //           width: double.infinity,
      //           color: Color.fromARGB(255, 255, 255, 255),
      //           child: GridView.builder(
      //               itemCount: SecondProducts.length,
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 4,
      //                   mainAxisSpacing: 2.0,
      //                   crossAxisSpacing: 2.0,
      //                   childAspectRatio: 4 / 4),
      //               itemBuilder: (context, index) {
      //                 return Card(
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Image.asset(
      //                         "${SecondProducts[index]['image']}",
      //                         width: 35,
      //                         height: 35,
      //                       ),
      //                       SizedBox(height: 10.0),
      //                       Text(
      //                         "${SecondProducts[index]['name']}",
      //                         textAlign: TextAlign.center,
      //                         style: TextStyle(
      //                           color: Color.fromARGB(255, 7, 125, 180),
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 );
      //               }),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
