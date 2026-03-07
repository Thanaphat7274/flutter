import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(radius: 40),
        SizedBox(height: 10),
        SizedBox(width: 70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Thanaphat"), Text("Posts")],
        ),
        SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Thanaphat"), Text("Followers")],
        ),
        SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Thanaphat"), Text("Following")],
        ),
      ],
    );
  }
}
