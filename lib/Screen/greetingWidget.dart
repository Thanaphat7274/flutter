import 'package:first_project/component/profile_card.dart';
import 'package:first_project/component/text_card.dart';
import 'package:flutter/material.dart';

class Greetingwidget extends StatelessWidget {
  final String name;
  final Color bgcolor;
  const Greetingwidget({super.key, required this.name,required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCard(text: "Good Afternoon",textcolor: Colors.blueGrey,),
            SizedBox(height: 10,),

            ProfileCard(name: "thanaphat",url:"https://img.freepik.com/free-photo/closeup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_488145-3540.jpg?semt=ais_hybrid&w=740&q=80" ,),
          ],
        ),
      ),
    );
  }
}
