import 'package:flutter/material.dart ';
import 'package:tp_twitter/tweet/footer.dart';
import 'package:tp_twitter/tweet/header.dart';
import 'package:tp_twitter/tweet/tweet-card.dart';

class TweetPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          // Header
          Header(),
          // Content
          Expanded(child: Column(
            children: [
              TweetCard(),
            ],
          )),
          // Footer
          Footer(),
        ],
      ),
    );
  }

}