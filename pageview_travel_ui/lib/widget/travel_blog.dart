import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pageview_travel_ui/modelclass/travel.dart';

class TravelBlog extends StatefulWidget {
  const TravelBlog({super.key});

  @override
  State<TravelBlog> createState() => _TravelBlogState();
}

class _TravelBlogState extends State<TravelBlog> {
  final travel_blog_list = Travel.generatedTravelList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: travel_blog_list.length,
          itemBuilder: (context, index) {
            var travel = travel_blog_list[index];
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: Image.asset(
                    travel.img,
                    width: 380.0,
                    height: 440.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 10.0,
                  child: Column(
                    children: [
                      Text(
                        travel.country,
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 245, 17),
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        travel.address,
                        style: TextStyle(
                            color: Color.fromARGB(255, 231, 247, 145),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 20.0,
                    bottom: 10.0,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color.fromARGB(255, 3, 28, 173)),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ))
              ],
            );
          }),
    );
  }
}
