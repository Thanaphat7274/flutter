import 'package:flutter/material.dart';

class ProfileStats extends StatefulWidget {
  const ProfileStats({super.key});

  @override
  State<ProfileStats> createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Thanaphat Dev',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 2),
          Text('Flutter Developer', style: TextStyle(fontSize: 14)),
          SizedBox(height: 2),
          Text('thanaphat', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
