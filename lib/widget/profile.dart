import 'package:flutter/material.dart';

import '../res/color.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  final String userName = "Shivraj Tharu";
  final String userEmail = "shivrajtharu62@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile.png'), // Provide your image path
            ),
            const SizedBox(height: 16.0),
            Text(
              userName,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              userEmail,
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            // Add more user information widgets
          ],
        ),
      ),
    );
  }
}
