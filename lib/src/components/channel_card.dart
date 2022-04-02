import 'package:flutter/material.dart';
import 'package:words_of_love/src/models/channel.dart';

class ChannelCard extends StatelessWidget {
  final Channel channel;
  final Function onDoubleTap;
  final kImageRadius = 40.0;
  const ChannelCard({
    Key? key,
    required this.channel,
    required this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => onDoubleTap(),
      child: Container(
        height: 120,
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: kImageRadius,
              ),
              padding: EdgeInsets.fromLTRB(kImageRadius + 10, 5, 5, 5),
              decoration: BoxDecoration(
                color: channel.subscribed ? Colors.black : Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    channel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    channel.description,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: NetworkImage(channel.thumbnailUrl),
                radius: kImageRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
