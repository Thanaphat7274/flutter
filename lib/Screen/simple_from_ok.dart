import 'package:flutter/material.dart';

class SimpleFromOk extends StatefulWidget {
  final String nameuser;
  final String password;
  final String name;
  final String lastName;
  const SimpleFromOk({
    Key? key,
    required this.nameuser,
    required this.password,
    required this.name,
    required this.lastName,
  }) : super(key: key);

  @override
  State<SimpleFromOk> createState() => _SimpleFromOkState();
}

class _SimpleFromOkState extends State<SimpleFromOk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ข้อมูลที่กรอกมา"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 45),
            Text(
              "สมัครสมาชิกสำเร็จเเล้ว",
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.topLeft,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ชื่อผู้ใช้ : ${widget.nameuser}",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "รหัสผ่าน : ${'*' * widget.password.length}",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text("ชื่อ : ${widget.name}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text(
                    "นามสกุล : ${widget.lastName}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
