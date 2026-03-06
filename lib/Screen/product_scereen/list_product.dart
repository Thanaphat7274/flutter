import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/product_data.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  Future<List<ProductData>> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:3000/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => ProductData.fromjson(json)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> createProduct(
    String id,
    String name,
    String desc,
    double price,
  ) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "name": name,
          "description": desc,
          "price": price,
        }),
      );
      if (response.statusCode == 201) {
        print("เพิ่มข้อมูลสำเร็จ!");

        setState(() {});
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
    dynamic idUpdate,
    String name,
    String desc,
    double price,
  ) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:3000/products/$idUpdate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "description": desc, "price": price}),
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(dynamic idDelete) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:3000/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        if (!mounted) return;

        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ลบข้อมูลสำเร็จเรียบร้อย'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('เกิดข้อผิดพลาด: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void showAddDialog() {
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('เพิ่มสินค้าใหม่'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: "id"),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'รายละเอียด'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'ราคา (บาท)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
            ),

            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String desc = descController.text;
                String id = idController.text;

                double price = double.tryParse(priceController.text) ?? 0.0;

                createProduct(id, name, desc, price);

                Navigator.pop(context);
              },
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(ProductData product) {
    TextEditingController nameController = TextEditingController(
      text: product.name,
    );
    TextEditingController descController = TextEditingController(
      text: product.description,
    );
    TextEditingController priceController = TextEditingController(
      text: product.price.toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('แก้ไขข้อมูลสินค้า'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'รายละเอียด'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'ราคา (บาท)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text;
                String newDesc = descController.text;
                double newPrice = double.tryParse(priceController.text) ?? 0.0;

                updateProduct(product.id, newName, newDesc, newPrice);

                Navigator.pop(context);
              },
              child: const Text('บันทึกการแก้ไข'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product'), backgroundColor: Colors.blueGrey),
      body: FutureBuilder<List<ProductData>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductData> products = snapshot.data!;
            return ListView.separated(
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.grey);
              },
              itemBuilder: (context, index) {
                ProductData product = products[index];
                return ListTile(
                  leading: Text(product.id.toString()),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  onTap: () {
                    showEditDialog(product);
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${product.price} ฿'),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          deleteProduct(product.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(child: Text('no data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
