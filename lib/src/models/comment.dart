import 'package:hive/hive.dart';
import 'package:words_of_love/src/models/author.dart';

part 'comment.g.dart';

@HiveType(typeId: 2)
class Comment extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final Author authorData;
  @HiveField(2)
  final String content;

  Comment({
    required this.id,
    required this.authorData,
    required this.content,
  });
}
