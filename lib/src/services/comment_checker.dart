import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/models/comment.dart';

class CommentChecker {
  static const int _preferredCommentLength = 200;
  static const int _acceptanceThreshold = 6;
  static final List<String> _mayNotOccur = [
    "video",
    "mix",
  ];

  static int _dictionaryCheck(Comment comment) {
    int score = 5;
    for (var word in _mayNotOccur) {
      if (comment.content.contains(word)) {
        score -= 1;
        if (score <= 0) return 0;
      }
    }
    if (comment.content.contains(comment.authorData.name)) score -= 1;
    if (score < 0) score = 0;
    return score;
  }

  static int _lengthCheck(Comment comment) {
    if (comment.content.length >= _preferredCommentLength) return 5;
    return comment.content.length ~/ _preferredCommentLength;
  }

  static bool isCommentOk(Comment comment) {
    int score = 0;
    score += _dictionaryCheck(comment);
    score += _lengthCheck(comment);
    return score > _acceptanceThreshold ? true : false;
  }
}
