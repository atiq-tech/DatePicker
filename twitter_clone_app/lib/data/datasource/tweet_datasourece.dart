import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_clone_app/data/models/tweet_model.dart';

class TweetDatasource {
  static Future<List<TweetModel>> getAllTweets() async {
    List<TweetModel> tweetList = [];
    http.Response res = await http
        .get(Uri.parse("https://635430dee64783fa828106ed.mockapi.io/tweet"));
    if (res.statusCode == 200) {
      List parsedJson = jsonDecode(res.body);
      parsedJson.forEach((tweet) {
        tweetList.add(TweetModel.fromJson(tweet));
      });
    }
    return tweetList;
  }

  static Future<bool> postTweet(TweetModel tweetModel) async {
    http.Response res = await http.post(
        Uri.parse("https://635430dee64783fa828106ed.mockapi.io/tweet"),
        body: tweetModel.toJson());
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
