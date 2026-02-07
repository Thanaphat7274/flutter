import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String text;
  final Color textcolor;
  const TextCard({super.key,required this.text,required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return  Container(
              color: textcolor,
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
  }
}