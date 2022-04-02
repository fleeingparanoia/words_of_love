import 'package:hive/hive.dart';
import 'package:words_of_love/src/constants/const_functions.dart';
import 'package:words_of_love/src/models/video.dart';

part 'channel.g.dart';

@HiveType(typeId: 0)
class Channel extends HiveObject {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String url;
  @HiveField(3)
  late final String thumbnailUrl;
  @HiveField(4)
  late final String description;
  @HiveField(5)
  List<Video> videos = [];
  @HiveField(6)
  bool subscribed = false;

  Channel({
    required this.name,
    required this.id,
    required this.url,
    required this.thumbnailUrl,
    required this.description,
  });

  Channel.fromMapApi(Map jsonData) {
    name = jsonData["author"];
    id = jsonData["authorId"];
    url = jsonData["authorUrl"];
    thumbnailUrl = kAddHttpsIfNeeded(jsonData["authorThumbnails"].last["url"]);
    description = jsonData["description"];
    jsonData["subscribed"] == null
        ? subscribed = false
        : subscribed = jsonData["subscribed"];
  }

  Channel.fromMapDb(Map data) {
    id = data["id"];
    name = data["name"];
    url = data["url"];
    thumbnailUrl = data["thumbnailUrl"];
    description = data["description"];
    subscribed = data["subscribed"] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "url": url,
      "thumbnailUrl": thumbnailUrl,
      "description": description,
      "subscribed": subscribed
    };
  }

  @override
  toString() => name;
}
