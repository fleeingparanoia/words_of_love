import 'package:hive/hive.dart';
import 'package:words_of_love/src/models/comment.dart';

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
