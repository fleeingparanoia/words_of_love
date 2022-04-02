import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:words_of_love/src/models/author.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/models/video.dart';
import 'invidious_instance_manager.dart';

class InvidiousApiHelper {
  String currentInstance = "";

  InvidiousInstanceManager instanceManager = InvidiousInstanceManager();

  InvidiousApiHelper._instance();
  static final InvidiousApiHelper instance = InvidiousApiHelper._instance();

  Future<bool> init() async {
    if (await instanceManager.init() == false) {
      return false;
    }

    currentInstance = await instanceManager.getOtherInstance();

    // Get to the default api endpoint
    currentInstance = "https://" + currentInstance + "/api/v1/";

    return true;
  }

  Future<List<Channel>> searchChannel(String query) async {
    String requestUrl = currentInstance +
        "search?q=$query&type=channel&fields=author,authorId,authorUrl,authorThumbnails,description";
    http.Response response = await http.get(Uri.parse(requestUrl));
    var parsedJson = jsonDecode(utf8.decode(response.bodyBytes));

    List<Channel> results = [];
    for (var channelJson in parsedJson) {
      results.add(Channel.fromMapApi(channelJson));
    }

    return results;
  }

  Future<List<Video>> fetchNewVideos(Channel channel) async {
    String requestUrl =
        currentInstance + "channels/${channel.id}?fields=latestVideos";
    http.Response response = await http.get(Uri.parse(requestUrl));
    var parsedJson = jsonDecode(utf8.decode(response.bodyBytes));
    parsedJson = parsedJson["latestVideos"];

    List<Video> videos = [];
    for (int i = 0; i < parsedJson.length - channel.videos.length; i++) {
      videos.add(Video(
        id: parsedJson[i]["videoId"],
        title: parsedJson[i]["title"],
        thumbnailUrl: parsedJson[i]["videoThumbnails"].last["url"],
      ));
    }
    return videos;
  }

  Future<List<Comment>> fetchTopComments(Video video, int commentCount) async {
    String requestUrl = currentInstance + "comments/${video.id}?sort_by=top";
    http.Response response = await http.get(Uri.parse(requestUrl));
    var parsedJson = jsonDecode(utf8.decode(response.bodyBytes));

    List<Comment> comments = [];
    for (int i = 0; i < min(parsedJson["comments"].length, commentCount); i++) {
      comments.add(Comment(
          id: parsedJson["comments"][i]["commentId"],
          authorData: Author.fromJson(parsedJson["comments"][i]),
          content: parsedJson["comments"][i]["content"]));
    }
    return comments;
  }
}
