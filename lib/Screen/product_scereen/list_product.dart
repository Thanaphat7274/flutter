import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

Future<void> fetchData() async {
  try {
    var response = await http.get(Uri.parse('http://localhost:3000/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      //code somthing...
      print(jsonList);
    } else {
      throw Exception("Failed to load products");
    }
  } catch (e) {
    print(e);
  }
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            fetchData();
          }, child: Text("Fetch Data")),
        ],
      ),
    );
  }
}
