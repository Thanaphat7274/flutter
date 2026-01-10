import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 139, 47)),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("First Time App"),backgroundColor: Colors.white,

      ),
      body:
      Stack(alignment:Alignment.center,
        children:[
          Positioned(
            top: 250,
            left: 150,          
            child: Container(
              height: 300,
              width: 120,
              decoration:BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          Positioned(
            top: 275,
            left: 175,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
            ),
          ),
          Positioned(
            top: 360,
            right: 180,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.yellow,
            ),
          ),
          Positioned(
            top: 450,
            right: 178,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          )
        ]
      ),
      backgroundColor: const Color.fromARGB(255, 240, 239, 238),
    );
  }
}

