import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hi"),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: 
            (){
              Navigator.pop(context, MaterialPageRoute<void>(builder: (BuildContext context)=> const ContentScreen()));
            }, child: Text("Content"))
          ],
        )
      ),
    );
  }
}