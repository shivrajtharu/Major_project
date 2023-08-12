import 'package:flutter/material.dart';
import 'package:major_project/view/home_view.dart';
import 'package:major_project/widget/news.dart';
import 'package:major_project/widget/plan.dart';
import '../../widget/profile.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currentIndex=0;
  final screens= [
    const HomeView(),
    const News(),
    const Plan(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor:Colors.black,
        unselectedItemColor: Colors.black54,
        iconSize: 28,
        selectedFontSize: 16,
        unselectedFontSize:12,
        currentIndex:currentIndex,
        onTap:(index)=>setState(()=>currentIndex=index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          )
        ],
      ),
    );
  }
}
