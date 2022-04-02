import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/services/boxes.dart';

class CommentController {
  static List<Comment> likedComments() {
    return Boxes.getComments().values.toList();
  }

  static bool isLiked(Comment comment) {
    return Boxes.getComments().containsKey(comment.id);
  }

  static Future<void> like(Comment comment) async {
    await Boxes.getComments().put(comment.id, comment);
  }

  static Future<void> unlike(Comment comment) async {
    await Boxes.getComments().delete(comment.id);
  }
}
