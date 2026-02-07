import 'package:first_project/Screen/content_screen.dart';
import 'package:first_project/component/like_card.dart';
import 'package:first_project/component/profile_card.dart';
import 'package:first_project/component/text_card.dart';
import 'package:flutter/material.dart';

class Greetingwidget extends StatelessWidget {
  final String name;
  final Color bgcolor;
  const Greetingwidget({super.key, required this.name, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCard(text: "Good Afternoon", textcolor: Colors.blueGrey),
            SizedBox(height: 10),

            ProfileCard(
              name: "thanaphat",
              url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAxt_0PJ8T-KXXZa6YvyLG9iwdnCjpy-VfAQ&s",
            ),
            LikeCard(),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: 
            (){
              Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context)=> const ContentScreen()));
            }, child: Text("Content"))
          ],
        ),
      ),
    );
  }
}
