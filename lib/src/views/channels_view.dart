import 'package:flutter/material.dart';
import 'package:words_of_love/src/components/channel_card.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/controllers/channel_controller.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/screens/search_channel_screen.dart';
import 'package:words_of_love/src/services/invidious_api_helper.dart';

class ChannelsPage extends StatefulWidget {
  ChannelsPage({Key? key}) : super(key: key);

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  String searchQuery = "";

  bool termWasSearched = false;

  @override
  void initState() {
    InvidiousApiHelper.instance.init();
    super.initState();
  }

  Future<List<Channel>> searchChannel(String query) async {
    List<Channel> foundChannels = [];
    List result = await InvidiousApiHelper.instance.searchChannel(query);
    for (var channel in result) {
      foundChannels.add(channel);
    }
    return foundChannels;
  }

  @override
  Widget build(BuildContext context) {
    // The screen got opened - show subscribed Channels
    List<Channel> _subscribedChannels = ChannelController.subscribedChannels();

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: CustomScrollView(
        slivers: [
          const CrazyAppbar(
            title: "Channels",
          ),
          SliverToBoxAdapter(
              child: TextButton(
            child: Text("Add Channels"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchChannelScreen()));
            },
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Dismissible(
                  key: Key(_subscribedChannels[index].id),
                  onDismissed: ((direction) {
                    ChannelController.unsubscribe(_subscribedChannels[index]);
                    setState(() {});
                  }),
                  child: ChannelCard(
                    channel: _subscribedChannels[index],
                    onDoubleTap: () {},
                  ),
                );
              },
              childCount: _subscribedChannels.length,
            ),
          )
        ],
      ),
    );
  }
}
