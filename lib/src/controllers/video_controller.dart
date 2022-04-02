import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/models/video.dart';
import 'package:words_of_love/src/services/comment_checker.dart';
import 'package:words_of_love/src/services/invidious_api_helper.dart';

class VideoController {
  static Future<List<Comment>> fetchTopComments(Video video) async {
    List<Comment> topComments = await InvidiousApiHelper.instance
        .fetchTopComments(video, kTopCommentCount);
    return topComments;
  }

  static List<Comment> processComments(List<Comment> comments) {
    // comments
    //     .removeWhere((comment) => CommentChecker.isCommentOk(comment) == false);
    return comments;
  }
}
