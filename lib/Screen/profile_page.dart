import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stats.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thanaphat", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ProfileHeader(), ProfileStats()],
        ),
      ),
    );
  }
}
