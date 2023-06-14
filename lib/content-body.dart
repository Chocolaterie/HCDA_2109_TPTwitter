import 'package:flutter/material.dart';
import 'package:tp_twitter/lopin-form.dart';
import 'package:tp_twitter/tweet-card.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        LoginForm(),
        TweetCard(),
      ],
    );
  }
}
