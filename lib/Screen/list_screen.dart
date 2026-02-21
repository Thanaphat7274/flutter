import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}
class User{
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });
factory User.fromJson (Map<String,dynamic>json){
  return User(
    id:json['id'],
    firstName: json['firstName'] ?? '', 
    lastName: json['lastName'] ?? '',
    username: json['username'] ?? '',
    email: json['email'] ?? '',
  );
}
}
class _ListScreenState extends State<ListScreen> {
  Future<List<User>> getUser() async{
    try{
      var response = await http.get(
        Uri.parse('https://dummyjson.com/users'),
      );
      if(response.statusCode == 200){
      // 1. แปลงข้อความ JSON ให้กลายเป็น Map Object
        Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      // 2. เจาะเข้าไปดึง Array ที่อยู่ในคีย์ 'users'  
        List<dynamic> jsonArray = jsonResponse['users'] ;
      // 3. แปลงแต่ละก้อนใน Array ให้กลายเป็น Class User
        List<User> usersList = jsonArray.map((json) => User.fromJson(json)).toList();
      return usersList;
      }else{
        throw Exception('Fail to fetch data');
      }
    }catch(e){
      throw Exception('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Api'),),
      body: FutureBuilder<List<User>>(
        future: getUser(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<User> users = snapshot.data!;
            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.grey);
              },
              itemBuilder: (context, index) {
                User user = users[index];
                return ListTile(
                  leading: Text(user.id.toString()),
                  title: Text('${user.firstName} ${user.lastName}'), // ชื่อ-นามสกุล
                  subtitle: Text(user.email),
                  trailing: Text('(${user.username})'),
                );
              },
            );
          }
          return const Center(child: Text('no data'),);
        },
      )
    );
  }
}