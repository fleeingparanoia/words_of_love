import 'package:flutter/material.dart';
import 'package:words_of_love/src/components/channel_card.dart';
import 'package:words_of_love/src/components/crazy_app_bar.dart';
import 'package:words_of_love/src/constants/const_values.dart';
import 'package:words_of_love/src/controllers/channel_controller.dart';
import 'package:words_of_love/src/models/channel.dart';
import 'package:words_of_love/src/services/invidious_api_helper.dart';

class SearchChannelScreen extends StatefulWidget {
  const SearchChannelScreen({Key? key}) : super(key: key);

  @override
  State<SearchChannelScreen> createState() => _SearchChannelScreenState();
}

class _SearchChannelScreenState extends State<SearchChannelScreen> {
  List<Channel> _searchResults = [];

  Future<void> search(String query) async {
    _searchResults = await InvidiousApiHelper.instance.searchChannel(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future<void> subscribeChannel(Channel channel) async {
      await ChannelController.subscribe(channel);
      setState(() {});
    }

    Future<void> unSubscribeChannel(Channel channel) async {
      await ChannelController.unsubscribe(channel);
      setState(() {});
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: kDefaultPadding / 2,
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
        ),
        child: CustomScrollView(
          slivers: [
            CrazyAppbar.withSearch(
              title: "Search for a channel",
              onSearchTapped: (query) {
                setState(() {
                  search(query);
                });
              },
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ChannelCard(
                    channel: _searchResults[index],
                    onDoubleTap: () => _searchResults[index].subscribed
                        ? unSubscribeChannel(_searchResults[index])
                        : subscribeChannel(_searchResults[index]),
                  );
                },
                childCount: _searchResults.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
