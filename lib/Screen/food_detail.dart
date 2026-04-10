import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Detail"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ผัดไท",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 5),
            Icon(Icons.dinner_dining, size: 80, color: Colors.orange),
            SizedBox(height: 8),
            Text(
              "แสดงรายละเอียดอาหาร เช่นผัดไทรสชาติเข้มข้น ใส่กุ้งสด ไข่ และถั่วงอก",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1),
            Text("เสิร์ฟพร้อมมะนาวและถั่วลิสงบด", textAlign: TextAlign.center),
            SizedBox(height: 15),
            Text(
              "ราคา: 90 บาท",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
