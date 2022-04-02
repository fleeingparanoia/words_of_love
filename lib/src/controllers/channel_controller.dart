import 'dart:math';

import 'package:words_of_love/src/controllers/video_controller.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/models/video.dart';
import 'package:words_of_love/src/services/boxes.dart';
import 'package:words_of_love/src/services/invidious_api_helper.dart';

class ChannelController {
  static List<Channel> subscribedChannels() {
    return Boxes.getChannels().values.toList();
  }

  static Future<void> subscribe(Channel channel) async {
    channel.subscribed = true;
    await Boxes.getChannels().put(channel.id, channel);
  }

  static Future<void> unsubscribe(Channel channel) async {
    await Boxes.getChannels().delete(channel.id);
  }

  static bool isSubscribed(Channel channel) {
    return Boxes.getChannels().get(channel.id)!.subscribed;
  }

  static Future<void> fetchNewVideos(Channel channel) async {
    // Get the channel from the database...maybe the reference is not up to date
    channel = Boxes.getChannels().get(channel.id)!;
    await InvidiousApiHelper.instance.init();
    List<Video> newVideos =
        await InvidiousApiHelper.instance.fetchNewVideos(channel);
    channel.videos.addAll(newVideos);
    await Boxes.getChannels().put(channel.id, channel);
  }

  static Future<List<Video>> shuffleAllVideos() async {
    List<Video> videos = [];
    for (var channel in Boxes.getChannels().values) {
      if (channel.videos.isEmpty) await fetchNewVideos(channel);
      videos.addAll(channel.videos);
    }
    videos.shuffle();
    return videos;
  }

  int currentVideo;
  List<Video> shuffledVideos;
  ChannelController()
      : currentVideo = 0,
        shuffledVideos = [];

  Future<Video?> getNextVideo() async {
    if (shuffledVideos.isEmpty || currentVideo >= shuffledVideos.length - 1) {
      shuffledVideos = await shuffleAllVideos();
      if (shuffledVideos.isEmpty) return null;
    }
    currentVideo++;
    return (shuffledVideos[currentVideo]);
  }
}
