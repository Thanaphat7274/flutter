import 'package:flutter/material.dart';
import 'simple_from_ok.dart';

class SimpleFormScreen extends StatefulWidget {
  const SimpleFormScreen({super.key});

  @override
  State<SimpleFormScreen> createState() => _SimpleFormScreenState();
}

class _SimpleFormScreenState extends State<SimpleFormScreen> {
  String strInput = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameuserController = TextEditingController();
  final TextEditingController _last_nameController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("สมัครสมาชิก", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Dispplay input : $strInput'),

            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'ชื่อผู้ใช้',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล";
                }
                return null;
              },
            ),
            //password
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController1,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: 'รหัสผ่าน',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล password";
                }
                return null;
              },
            ),
            //ยืนยันรหัส
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController2,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: 'ยืนยันรหัสผ่าน',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล password";
                }
                if (value != _passwordController1.text) {
                  return "รหัสผ่านไม่ถูกต้อง";
                }
                return null;
              },
            ),
            //ชื่อ ผู้ใช้
            SizedBox(height: 20),
            TextFormField(
              controller: _nameuserController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'ชื่อ',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            //ชื่อ สกุล
            TextFormField(
              controller: _last_nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'นามสกุล',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "กรุณากรอกขอมูล";
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    strInput =
                        "Username : ${_nameController.text} Password : ${_passwordController1.text}";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SimpleFromOk(
                          nameuser: _nameController.text,
                          name: _nameuserController.text,
                          lastName: _last_nameController.text,
                          password: _passwordController1.text,
                        ),
                      ),
                    );
                  });
                } else {
                  setState(() {
                    strInput = "Form is incalid";
                  });
                }
              },
              child: Text("สมัครสมาชิก"),
            ),
            SizedBox(height: 25),
            //ปุ่มclear
            ElevatedButton(
              onPressed: () {
                _nameController.clear();
                _passwordController1.clear();
                _passwordController2.clear();
                _last_nameController.clear();
                _nameuserController.clear();
              },
              child: Text("clear"),
            ),
            SizedBox(height: 25),
            //autofill
            ElevatedButton(
              onPressed: () {
                _nameController.text = "thamnaphat.wr";
                _last_nameController.text = "sukchuen";
                _nameuserController.text = "Enzio";
              },
              child: Text("Auto fill"),
            ),
          ],
        ),
      ),
    );
  }
}
