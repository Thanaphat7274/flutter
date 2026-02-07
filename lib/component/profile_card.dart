import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String url;
  const ProfileCard({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {

    return Container(
          color: Colors.blueGrey,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(url),
                backgroundColor: Colors.grey,
              ),
            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "sukchuen_t@su.ac.th",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            )
            ],
          ),
          
    );
  }
}