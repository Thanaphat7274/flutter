import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/Screen/content_screen.dart';
import 'package:first_project/Screen/greetingWidget.dart';
import 'package:flutter/material.dart';
import 'package:first_project/Screen/list_screen.dart';
import 'package:first_project/Screen/product_scereen/list_product.dart';
import 'Screen/airQuality_screen.dart';
import 'firebase_options.dart';
import 'Screen/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 139, 47),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/product',
      routes: {
        '/greeting': (context) =>
            Greetingwidget(name: "sukchuen", bgcolor: Colors.red),
        '/content': (context) => ContentScreen(),
        '/user': (context) => ListScreen(),
        '/product': (context) => ListProduct(),
        '/aqi': (context) => AirqualityScreen(),
        '/profile': (context) => ProfilePage(),
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
        title: const Text("First Time App"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(tileColor: Colors.blue, title: Text('Item $index'));
          },
        ),
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
