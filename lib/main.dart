import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_of_love/src/models/author.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/models/video.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChannelAdapter());
  Hive.registerAdapter(AuthorAdapter());
  Hive.registerAdapter(CommentAdapter());
  Hive.registerAdapter(VideoAdapter());
  await Hive.openBox<Channel>('channels');
  await Hive.openBox<Comment>('likedComments');
  runApp(const App());
}
