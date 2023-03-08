import 'package:flutter/material.dart';
import 'package:twitter_clone_app/data/datasource/tweet_datasourece.dart';
import 'package:twitter_clone_app/data/models/tweet_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _tweetTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Color.fromARGB(255, 191, 248, 191),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            context: context,
                            builder: (context) => Container(
                                  height: 500.0,
                                  padding: EdgeInsets.only(
                                      top: 40, left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _nameTextEditingController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: "Name"),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextField(
                                        controller: _tweetTextEditingController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: "Tweet"),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      ElevatedButton(
                                          onPressed: () async {
                                            String name =
                                                _nameTextEditingController.text;
                                            String tweet =
                                                _tweetTextEditingController
                                                    .text;

                                            await TweetDatasource.postTweet(
                                                TweetModel(
                                                    writter: name,
                                                    tweet: tweet));
                                          },
                                          child: Text("Post")),
                                    ],
                                  ),
                                ));
                      },
                      child: Text("Post a Tweet")),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("refresh pressed");
                        setState(() {});
                      },
                      child: Text("Refresh")),
                )
              ],
            )),
        Expanded(
          flex: 10,
          child: FutureBuilder(
            future: TweetDatasource.getAllTweets(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("Error loading data ${snapshot.error}");
              }
              if (snapshot.hasData) {
                List<TweetModel> alldata = snapshot.data;
                return ListView.builder(
                    itemCount: alldata.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage("https://i.pravatar.cc/300"),
                        ),
                        title: Text(
                          "${alldata[index].writter}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 201, 4, 151),
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        subtitle: Text(
                          "${alldata[index].postedAt}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 4, 202),
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );

//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Atiq + Tamanna",
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 94, 2, 117),
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "2022-10-25T13:47:45.218Z",
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 3, 131, 3),
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           subtitle: Text(
//             "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.",
//             style: TextStyle(
//                 color: Color.fromARGB(255, 54, 3, 194),
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
  }
}
