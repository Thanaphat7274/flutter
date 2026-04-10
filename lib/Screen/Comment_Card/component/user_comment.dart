import 'package:flutter/material.dart';

class UserComment extends StatefulWidget {
  final String name;
  final String comment;

  const UserComment({super.key, required this.name, required this.comment});

  @override
  State<UserComment> createState() => _UserCommentState();
}

class _UserCommentState extends State<UserComment> {
  int likeCount = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepPurple.shade100,
                child: Text(
                  widget.name.isNotEmpty ? widget.name[0].toUpperCase() : "?",
                  style: TextStyle(
                    color: Colors.deepPurple.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.comment,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "1 h ago",
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    likeCount += isLiked ? 1 : -1;
                  });
                },
                icon: Icon(
                  isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  size: 20,
                  color: isLiked ? Colors.blue : Colors.black54,
                ),
              ),
              SizedBox(width: 6),
              Text(
                "$likeCount",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.comment),
              SizedBox(width: 6),
              Text("Reply"),
            ],
          ),
        ],
      ),
    );
  }
}
