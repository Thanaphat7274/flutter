import 'package:flutter/material.dart';
import 'component/user_comment.dart';

class CommentScereen extends StatefulWidget {
  const CommentScereen({super.key});

  @override
  State<CommentScereen> createState() => _CommentScereenState();
}

class _CommentScereenState extends State<CommentScereen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comment Thread')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Column(
            children: [
              UserComment(name: 'User A', comment: 'This is the main comment.'),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: UserComment(name: 'User B', comment: 'i agree!.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
