import 'package:flutter/material.dart';

class LikeCard extends StatefulWidget {
  const LikeCard({super.key});

  @override
  State<LikeCard> createState() => _LikeCardState();
}

class _LikeCardState extends State<LikeCard> {
  bool isLike = true; 
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 350,
      height: 250,
      color: (isLike ? Colors.green : Colors.white),
      child: Column(
        children: [
          Text(isLike? "Liked" : "Dislike"),
          IconButton(onPressed: (){
            setState(() {
              isLike = !isLike;
            });
          }, icon: Icon(isLike ? Icons.thumb_up : Icons.thumb_down),),
          SizedBox(height: 10,),
          Text("Count : $count"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Increment"),
          IconButton(onPressed: (){
            setState(() {
              count++;
            });
          }, icon: Icon(Icons.add)
          ),
          SizedBox(height: 10,),
          Text("- Decrement"),
          IconButton(onPressed: (){
            setState(() {
              count--;
            });
          }, icon: Icon(Icons.remove)),
          SizedBox(height: 10,),
          Text("Reset"),
          IconButton(onPressed: 
          (){
            setState(() {
              count = 0;
            });
          }, icon: Icon(Icons.restore))
            ],
          )
        ],
      ),
    );
  }
}