import 'package:flutter/material.dart';
import 'package:major_project/pages/notification.dart';
import 'package:major_project/widget/drawer.dart';
import 'package:provider/provider.dart';
import '../pages/setting.dart';
import '../pages/share.dart';
import '../res/color.dart';
import '../res/components/home_list_view.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          elevation: 0,
          title: const Text("Traveller",style: TextStyle(fontWeight: FontWeight.bold)),
          foregroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                icon:  const Icon(Icons.notifications, size: 28,),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const NotificationPage()));
                },
              ),
            ),
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
              [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.black,),
                      SizedBox(width: 7.0,),
                      Text('Settings'),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.share, color: Colors.black,),
                      SizedBox(width: 7.0,),
                      Text('Share'),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black,),
                      SizedBox(width: 7.0,),
                      Text('logout'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      drawer: const MyDrawer(),
      body: HomeListView(),
    );
  }

  onSelected(BuildContext context, int item) {
    final userPreference = context.read<UserViewModel>();
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Settings()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Share()),
        );
        break;
      case 2:
        userPreference.remove().then((value){
          Navigator.pushNamed(context, RoutesName.login);
        });
        break;
    }
  }
}

