import 'package:hive/hive.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/models/comment.dart';

class Boxes {
  static Box<Channel> getChannels() => Hive.box('channels');
  static Box<Comment> getComments() => Hive.box('likedComments');
}
