import 'package:flutter/material.dart';

class SimpleFormScreen extends StatefulWidget {
  const SimpleFormScreen({super.key});

  @override
  State<SimpleFormScreen> createState() => _SimpleFormScreenState();
}

class _SimpleFormScreenState extends State<SimpleFormScreen> {
  String strInput = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("simple from")),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dispplay input : $strInput'),
            
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'UserName',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล";
                }
                return null;
              },
            ),
            //password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: 'Password',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล password";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    strInput =
                        "Username : ${_nameController} Password : ${_passwordController}";
                  });
                } else {
                  setState(() {
                    strInput = "Form is incalid";
                  });
                }
              },
              child: Text("ลงชื่อเข้าใช้"),
            ),
            SizedBox(height: 10),
            //ปุ่มclear
            ElevatedButton(
              onPressed: () {
                _nameController.clear();
                _passwordController.clear();
              },
              child: Text("clear"),
            ),
            SizedBox(height: 10),
            //autofill
            ElevatedButton(
              onPressed: () {
                _nameController.text = "thamnaphat.wr";
              },
              child: Text("Auto fill"),
            ),
          ],
        ),
      ),
    );
  }
}
