// The videos to which the comments correspond

import 'package:hive/hive.dart';

part 'video.g.dart';

@HiveType(typeId: 1)
class Video extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnailUrl;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  toString() => title;
}
