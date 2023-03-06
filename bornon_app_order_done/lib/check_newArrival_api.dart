// import 'dart:convert';

// import 'package:bornon_app/api_models/new_arrival_model.dart';
// import 'package:bornon_app/api_models/product_model.dart';
// import 'package:bornon_app/url_api/imgurl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;

// class CheclNewArrivalApi extends StatefulWidget {
//   const CheclNewArrivalApi({super.key});

//   @override
//   State<CheclNewArrivalApi> createState() => _CheclNewArrivalApiState();
// }

// class _CheclNewArrivalApiState extends State<CheclNewArrivalApi> {
// List<NewArrivalModel> allNewarrivalData = [];

// Future<List<NewArrivalModel>> fetchAllProducts() async {
//   try {
//     final response =
//         await http.get(Uri.parse("https://bornonbd.com/api/newarrival"));

//     NewArrivalModel newArrivalModel;

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       print("==========all products==========$data");
//       for (var i in data["data"]) {
//         newArrivalModel = NewArrivalModel.fromJson(i);
//         allNewarrivalData.add(newArrivalModel);
//       }
//     }
//     else {
//       throw Exception('Failed to load hotDealProductsList');
//     }
//   }
//    catch (e) {
//     Future.error("=====Errrrrrrrooooorrr=====$e");
//   }

//   return allNewarrivalData;
// }

//   // String Link = "https://bornonbd.com/api/newarrival";
//   // List<NewArrivalModel> allNewarrivalData = [];
//   // late NewArrivalModel newArrivalModel;

//   // Future<List<NewArrivalModel>> GetApiData() async {
//   //   try {
//   //     var Response = await http.get(Uri.parse(Link));
//   //     if (Response.statusCode == 200) {
//   //       var data = jsonDecode(Response.body)["data"];
//   //       print("========NewArrival=====data : ${data}");
//   //       for (var i in data) {
//   //         newArrivalModel = NewArrivalModel.fromJson(i);
//   //         allNewarrivalData.add(newArrivalModel);

//   //         print("aaaaaaaaaaaaaaaaaaaaaa length : ${allNewarrivalData.length}");
//   //       }
//   //     }
//   //   } catch (e) {
//   //     Future.error("Error amr vhul hocee amay khoma kori den:$e");
//   //   }
//   //   return allNewarrivalData;
//   // }

//   int isClick = 1;

//   late Future<List<NewArrivalModel>> _futureData;
//   @override
//   void initState() {
//     super.initState();
//     _futureData = fetchAllProducts();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 133, 173, 255),
//         title: Text(
//           "CheckNew Arrival Api",
//           style: TextStyle(
//             color: Color.fromARGB(255, 31, 30, 30),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//           child: Container(
//               height: 200.0,
//               width: double.infinity,
//               color: Color.fromARGB(255, 3, 37, 14),
//               child: FutureBuilder(
//                   future: _futureData,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Text("Error:${snapshot.error}");
//                     }
//                     if (snapshot.hasData) {
//                       List<NewArrivalModel> allNewarrivalData =
//                           snapshot.data ?? [];
//                       return ListView.separated(
//                         itemCount: allNewarrivalData.length,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           print("=========length:${allNewarrivalData.length}");
//                           return InkWell(
//                             onTap: () async {},
//                             child: Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Container(
//                                 width: 110.0,
//                                 decoration: const BoxDecoration(
//                                     color: Color.fromARGB(255, 255, 255, 255)),
//                                 child: Column(children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: NetworkImage(
//                                                 "$imgUrl${allNewarrivalData[index].mainImage}",
//                                               ),
//                                               fit: BoxFit.fill)),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       // color: Color.fromARGB(255, 145, 11, 122),
//                                       child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             const SizedBox(height: 20.0),
//                                             Text(
//                                               "${allNewarrivalData[index].name}",
//                                               style: const TextStyle(
//                                                   color: Color.fromARGB(
//                                                       255, 31, 30, 30),
//                                                   fontSize: 12.0),
//                                             ),
//                                             SizedBox(height: 5.0),
//                                             Text(
//                                               "${allNewarrivalData[index].price}",
//                                               style: const TextStyle(
//                                                   color: Color.fromARGB(
//                                                       255, 8, 117, 241),
//                                                   fontSize: 14.0),
//                                             ),
//                                             SizedBox(height: 10.0),
//                                           ]),
//                                     ),
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (_, index) =>
//                             const SizedBox(width: 15.0),
//                       );
//                     }
//                     return const Center(
//                         child: CircularProgressIndicator(
//                             color: Color.fromARGB(255, 250, 193, 255)));
//                   })),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:bornon_app/api_models/new_arrival_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ttttttttttttttttt extends StatefulWidget {
  const ttttttttttttttttt({super.key});

  @override
  State<ttttttttttttttttt> createState() => _tttttttttttttttttState();
}

class _tttttttttttttttttState extends State<ttttttttttttttttt> {
  List<Data> newArrivalProductsList = [];
  fetchNewArrivalProduct(context) async {
    Data datum;

    try {
      final response =
          await http.get(Uri.parse("https://bornonbd.com/api/newarrival"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("==========new arrival products==========$data");
        for (var i in data["data"]) {
          datum = Data.fromJson(i);
          newArrivalProductsList.add(datum);
        }
      } else {
        throw Exception('Failed to load hotDealProductsList');
      }
    } catch (e) {
      Future.error("=====Errrrrrrrooooorrr=====$e");
    }
    return newArrivalProductsList;
  }

  @override
  void initState() {
    fetchNewArrivalProduct(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${newArrivalProductsList.length}");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromARGB(100, 200, 0, 300),
          child: ListView.builder(
            itemCount: newArrivalProductsList.length,
            itemBuilder: (context, index) {
              return Text("${newArrivalProductsList[index].currencyAmount}");
            },
          ),
        ),
      ),
    );
  }
}
