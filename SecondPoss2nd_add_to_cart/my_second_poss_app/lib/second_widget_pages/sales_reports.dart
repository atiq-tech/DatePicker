import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_poss_app/common_widget/custom_appbar.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 142, 200, 255),
      appBar: CustomAppBar(title: "Sales Reports"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        color: Color.fromARGB(255, 142, 200, 255),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.0, 3.0),
                          spreadRadius: 2.0,
                          blurRadius: 15.0),
                    ],
                    image: DecorationImage(
                        image: AssetImage("images/g1.png"), fit: BoxFit.fill),
                    color: Color.fromARGB(255, 215, 157, 253),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 0.0),
                      child: Text(
                        "Sales diagram",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Sales Graph",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 250.0,
                width: double.infinity,
                //color: Color.fromARGB(255, 252, 200, 141),
                child: Row(
                  children: [
                    Container(
                      height: 250.0,

                      width: MediaQuery.of(context).size.width / 2 - 18,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3.0, 3.0),
                                spreadRadius: 2.0,
                                blurRadius: 15.0),
                          ],
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          SizedBox(height: 25.0),
                          Text(
                            "Quaterly Profits",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 5, 113, 238),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "97.9M",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 43, 41, 41)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 20.0,
                                right: 20.0,
                                top: 10.0),
                            child: Image.asset("images/pcrt.jpg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width / 2 - 18,
                      //color: Color.fromARGB(255, 4, 167, 53),
                      child: Column(
                        children: [
                          SizedBox(height: 6.0),
                          Expanded(
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 2 - 290,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(3.0, 3.0),
                                        spreadRadius: 2.0,
                                        blurRadius: 15.0),
                                  ],
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                children: [
                                  SizedBox(height: 25.0),
                                  Text(
                                    "Mktg.Spend",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 5, 113, 238)),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "54.25M",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 43, 41, 41)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 2 - 290,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(3.0, 3.0),
                                        spreadRadius: 2.0,
                                        blurRadius: 15.0),
                                  ],
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                children: [
                                  SizedBox(height: 25.0),
                                  Text(
                                    "Users",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 5, 113, 238)),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "25.06M",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 43, 41, 41)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.0, 3.0),
                          spreadRadius: 2.0,
                          blurRadius: 15.0),
                    ],
                    image: DecorationImage(
                        image: AssetImage("images/g2.jpg"), fit: BoxFit.fill),
                    color: Color.fromARGB(255, 215, 157, 253),
                    borderRadius: BorderRadius.circular(25.0)),
                child: Column(
                  children: [
                    SizedBox(height: 15.0),
                    Text(
                      "Conversion",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 5, 113, 238)),
                    ),
                    Text(
                      "0.9M",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 43, 41, 41)),
                    ),
                    Text(
                      "+19% of target",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 63, 62, 62)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
