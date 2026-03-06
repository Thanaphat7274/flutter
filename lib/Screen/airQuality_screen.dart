import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AirqualityScreen extends StatefulWidget {
  const AirqualityScreen({super.key});

  @override
  State<AirqualityScreen> createState() => _AirqualityScreenState();
}

class SimpleAqi {
  final int aqi;
  final String city;
  final num pm25;
  final int temperature;

  SimpleAqi({
    required this.aqi,
    required this.city,
    required this.pm25,
    required this.temperature,
  });

  factory SimpleAqi.fromjson(Map<String, dynamic> json) {
    return SimpleAqi(
      aqi: json['data']?['aqi'] ?? 0,
      city: json['data']?['city']?['name'] ?? 'ไม่ทราบชื่อเมือง',
      pm25: json['data']?['iaqi']?['pm25']?['v'] ?? 0,
      temperature: json['data']?['iaqi']?['t']?['v'] ?? 0,
    );
  }
}

class _AirqualityScreenState extends State<AirqualityScreen> {
  late Future<List<SimpleAqi>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchData();
  }

  Future<List<SimpleAqi>> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://api.waqi.info/feed/here/?token=f399b51eec422ff13051a22663e13cec20751151',
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        print(jsonMap); // ดู response จาก API
        return [SimpleAqi.fromjson(jsonMap)];
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  String getAqiScale(int aqi) {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  Color getAqiColor(int aqi) {
    if (aqi <= 50) {
      return Colors.greenAccent.shade700;
    } else if (aqi <= 100) {
      return Colors.yellow.shade700;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi <= 300) {
      return Colors.purple;
    } else {
      return Colors.brown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AIr Quality Index(AQI)"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<SimpleAqi>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<SimpleAqi> aqis = snapshot.data!;
            return ListView.separated(
              itemCount: aqis.length,
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.grey);
              },
              itemBuilder: (context, index) {
                SimpleAqi aqi = aqis[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${aqi.city}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: getAqiColor(aqi.aqi),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        aqi.aqi.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      getAqiScale(aqi.aqi),
                      style: TextStyle(
                        color: getAqiColor(aqi.aqi),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'PM2.5: ${aqi.pm25}  |  อุณหภูมิ: ${aqi.temperature}°C',
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _future = fetchData();
                        });
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: Text('ไม่พบข้อมูล'));
        },
      ),
    );
  }
}
