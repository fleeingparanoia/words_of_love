import 'package:flutter/material.dart';
import 'package:words_of_love/src/components/comment_card.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/controllers/comment_controller.dart';
import 'package:words_of_love/src/models/comment.dart';

class SavedPage extends StatefulWidget {
  SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<Comment> _likedComments = [];

  Future<void> getLikedComments() async {
    _likedComments = await CommentController.likedComments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getLikedComments();
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: CustomScrollView(
        slivers: [
          CrazyAppbar(title: "Saved comments"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CommentCard(
                  comment: _likedComments[index],
                  onDoubleTap: () async {
                    await CommentController.unlike(_likedComments[index]);
                    setState(() {});
                  },
                  color: Theme.of(context).primaryColor,
                );
              },
              childCount: _likedComments.length,
            ),
          )
        ],
      ),
    );
  }
}
