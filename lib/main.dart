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
      body: Center(
       child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              width : 100,
              color: Colors.red,
            ),
            Expanded(
              child:Container(
              height: 100,
              width : 100,
              color: Colors.green,
              ),
            ),
            Expanded(
              child:Container(
                height: 100,
                width:100,
                color:Colors.blue
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 240, 239, 238),
    );
  }
}

