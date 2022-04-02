import 'package:flutter/material.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final Color? color;
  final Function? onDoubleTap;
  const CommentCard(
      {required this.comment, this.color, this.onDoubleTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
              right: kDefaultPadding, top: kDefaultPadding),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(comment.authorData.thumbnail),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onDoubleTap: () => onDoubleTap!(),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 75,
                maxHeight: double.infinity,
              ),
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding * 2),
              decoration: BoxDecoration(
                color: color ?? Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                comment.content,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
