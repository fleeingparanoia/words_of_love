// An author is a person who writes the comment

import 'package:hive/hive.dart';

part 'author.g.dart';

@HiveType(typeId: 3)
class Author extends HiveObject {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String thumbnail;
  @HiveField(3)
  late final String url;

  Author(
      {required this.name,
      required this.id,
      required this.thumbnail,
      required this.url});

  Author.mock({required this.thumbnail})
      : id = "",
        url = "",
        name = "";

  Author.fromJson(Map json) {
    id = json["authorId"];
    name = json["author"];
    thumbnail = json["authorThumbnails"].last["url"];
    url = json["authorUrl"];
  }
}
