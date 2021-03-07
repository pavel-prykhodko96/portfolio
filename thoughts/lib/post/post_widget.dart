import 'package:flutter/material.dart';
import 'package:thoughts/post/post.dart';

class PostWidget extends StatelessWidget {
  Post post;

  PostWidget({this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(post.userId),
        Text(post.text),
      ],
    );
  }
}
