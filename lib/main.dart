import 'package:first_project/Screen/content_screen.dart';
import 'package:first_project/Screen/greetingWidget.dart';
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
      initialRoute: '/greeting',
      routes: {
        '/greeting':(context) =>Greetingwidget(name: "sukchuen", bgcolor: Colors.red),
        '/content' :(context) => ContentScreen(),
      },
      home: Greetingwidget(name: "thanaphat", bgcolor: Colors.amber),
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
        child :ListView.builder(
          itemCount:20,
          itemBuilder:(context,index){
            return ListTile(
              tileColor: Colors.blue,
              title: Text('Item $index'),
            );
          })
            // ListView(
            //   children: [
            //     Container(
            //       height: 350,
            //       width:double.infinity,
            //       color:Colors.blue
            //     ),
            //     Container(
            //       height: 350,
            //       width:double.infinity,
            //       color:Colors.yellow
            //     ),
            //     Container(
            //       height: 350,
            //       width:double.infinity,
            //       color:Colors.red
            //     )
            //   ],
            // ),
      ),
      
      backgroundColor: const Color.fromARGB(255, 240, 239, 238),
    );
  }
}


