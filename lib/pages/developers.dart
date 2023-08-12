import 'package:flutter/material.dart';

import '../res/color.dart';

class Developer {
  final String name;
  final String email;
  final String image;

  Developer({required this.name, required this.email, required this.image});
}

List<Developer> developers = [
  Developer(
      name: "Mr.Shivraj Tharu",
      email: "shivrajtharu62@gmail.com",
      image: "assets/images/shivraj.jpg"),
  Developer(
      name: "Mr.Shreedev Sharma",
      email: "sharma2345@gmail.com",
      image: "assets/images/shreedev.png"),
  Developer(
      name: "Mr.Ritesh Yadav",
      email: "yadavritesh12345@.com",
      image: "assets/images/ritesh.png"),
  Developer(
      name: "Mr.Bijay Chaudhary",
      email: "Bchaudhary78942@.com",
      image: "assets/images/bijay.png"),
];

class Developers extends StatelessWidget {
  const Developers({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Developers"),
        foregroundColor: Colors.black,
        backgroundColor: AppColors.appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: developers
              .map((developer) => Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(developer.image),
                  radius: 65,
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      developer.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      developer.email,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
