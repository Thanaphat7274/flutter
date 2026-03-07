import 'dart:io';

import 'package:flutter/material.dart';

class ProfileStats extends StatefulWidget {
  const ProfileStats({super.key});

  @override
  State<ProfileStats> createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("thanaphat"),
                Text("work|status"),
                GestureDetector(
                  onTap: () => _launchUrl('https://example.com'),
                  child: Text(
                    "https://example.com",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
