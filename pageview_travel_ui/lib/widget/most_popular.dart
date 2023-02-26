import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pageview_travel_ui/modelclass/travel.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  final travel_blog_list = Travel.mostPopular();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var travel = travel_blog_list[index];
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      travel.img,
                      width: 160.0,
                      height: 190.0,
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
                              color: Color.fromARGB(255, 4, 255, 46),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          travel.address,
                          style: TextStyle(
                              color: Color.fromARGB(255, 231, 247, 145),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, index) => SizedBox(width: 15.0),
            itemCount: travel_blog_list.length));
  }
}
