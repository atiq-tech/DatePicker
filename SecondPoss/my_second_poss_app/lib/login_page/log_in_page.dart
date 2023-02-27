import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 6, 126, 196),
        child: Stack(
          children: [
            Positioned(
                top: 250.0,
                left: 120.0,
                right: 120.0,
                child: Text(
                  "Pos Express",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25.0,
                      color: Colors.white),
                )),
            Positioned(
                bottom: 150.0,
                left: 10.0,
                right: 10.0,
                child: Container(
                    height: 260.0,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 11, 7, 248),
                            width: 3.2)),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text("User Name"),
                            hintText: "User Name",
                            hintStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 155, 152, 152)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 185, 185, 185)),
                            ),
                          ),
                          onTap: () async {},
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off),
                            suffixIconColor: Colors.grey,
                            label: Text("Password"),
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 18.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 155, 152, 152)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 185, 185, 185)),
                            ),
                          ),
                          onTap: () async {},
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          height: 35.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 88, 204, 91),
                                width: 2.0),
                            color: Color.fromARGB(255, 5, 114, 165),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "LOG IN",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                      ],
                    ))),
            Positioned(
              bottom: 370.0,
              left: 140.0,
              child: CircleAvatar(
                radius: 45.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
