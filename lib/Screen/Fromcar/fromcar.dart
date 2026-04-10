import 'package:flutter/material.dart';

class Fromcar extends StatefulWidget {
  const Fromcar({super.key});

  @override
  State<Fromcar> createState() => _FromcarState();
}

class _FromcarState extends State<Fromcar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _basePrice = 150;
  bool _vacuum = false;
  bool _wax = false;

  int get _totalPrice {
    int total = _basePrice;
    if (_vacuum) total += 50;
    if (_wax) total += 100;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำนวณค่าบริการล้างรถ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<int>(
                value: _basePrice,
                decoration: const InputDecoration(
                  labelText: 'ขนาดรถ',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 150,
                    child: Text('รถเล็ก (Small) - 150 บาท'),
                  ),
                  DropdownMenuItem(
                    value: 200,
                    child: Text('รถเก๋ง (Medium) - 200 บาท'),
                  ),
                  DropdownMenuItem(
                    value: 250,
                    child: Text('รถ SUV/กระบะ (Large) - 250 บาท'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _basePrice = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('ดูดฝุ่น (+50 บาท)'),
                value: _vacuum,
                onChanged: (value) {
                  setState(() {
                    _vacuum = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('เคลือบแว็กซ์ (+100 บาท)'),
                value: _wax,
                onChanged: (value) {
                  setState(() {
                    _wax = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  setState(() {});
                },
                child: const Text('คำนวณราคา'),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'ราคารวม: $_totalPrice บาท',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 34 / 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
