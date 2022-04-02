import "package:flutter/material.dart";
import 'package:words_of_love/src/components/comment_card.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/controllers/channel_controller.dart';
import 'package:words_of_love/src/controllers/comment_controller.dart';
import 'package:words_of_love/src/controllers/video_controller.dart';
import 'package:words_of_love/src/models/comment.dart';
import 'package:words_of_love/src/models/video.dart';

List<Comment> _commentList = [];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChannelController _channelController = ChannelController();

  Future<void> fetchNewComments() async {
    Video? nextVideo = await _channelController.getNextVideo();
    if (nextVideo == null) {
      setState(() {
        return;
      });
    }

    _commentList = await VideoController.fetchTopComments(nextVideo!);
    // Fetch again if there are no comments
    if (_commentList.isEmpty) {
      await fetchNewComments();
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> likeComment(Comment comment) async {
      await CommentController.like(comment);
      setState(() {});
    }

    Future<void> unlikeComment(Comment comment) async {
      await CommentController.unlike(comment);
      setState(() {});
    }

    if (_commentList.isEmpty) fetchNewComments();
    return RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: () async {
          await fetchNewComments();
        },
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: CustomScrollView(slivers: [
            const CrazyAppbar(
              title: "Hey, fellow friend UwU",
            ),
            _commentList.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return CommentController.isLiked(_commentList[index])
                          ? CommentCard(
                              comment: _commentList[index],
                              onDoubleTap: () =>
                                  unlikeComment(_commentList[index]),
                              color: Theme.of(context).primaryColor,
                            )
                          : CommentCard(
                              comment: _commentList[index],
                              onDoubleTap: () =>
                                  likeComment(_commentList[index]),
                            );
                    }, childCount: _commentList.length),
                  )
                : SliverToBoxAdapter(
                    child: Text(
                      "Something didn't quite work out as expected. \nYou should try to pull down from the top or check your internet connection",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
          ]),
        ));
  }
}
