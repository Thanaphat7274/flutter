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
      body:Center(
        child :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 
                Image.network(
                  "https://www.loc.gov/static/portals/free-to-use/public-domain/presidential-portraits/47-donald-trump.jpg",
                  height: 100,
                  width: 100,),
                Icon(
                  Icons.person,
                  size: 100,
                ),
                Image.asset(
                  'assets/download.jpg',
                  height: 100,
                  width: 100,
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {
                  print("Button Clicked");
                },
                child: Text("Click Me", style: TextStyle(color: Colors.white)),
              ),
              ],
            ),
      ),
      
      backgroundColor: const Color.fromARGB(255, 240, 239, 238),
    );
  }
}

