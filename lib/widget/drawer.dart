import 'package:flutter/material.dart';
import 'package:major_project/pages/developers.dart';
import 'package:major_project/pages/feed_back.dart';
import '../pages/contact.dart';
import '../pages/event.dart';
import '../pages/note.dart';
import '../pages/privacy_policy.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget> [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blueAccent,
            child: Center(
              child: Column(
                children:<Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin:const EdgeInsets.only(top: 30,bottom: 10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),fit: BoxFit.fill,

                        )
                    ),
                  ),
                  const Text("Mr.Shivraj Tharu",style: TextStyle(fontSize: 20,color: Colors.black),),
                  const Text("shivrajtharu62@gmail.com",style: TextStyle(color: Colors.black54),),

                ],
              ),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Developers(key: Key('value')),),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.contacts,),
              title: Text("About Developers",style: TextStyle(fontSize: 18),),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (
                  context) => const ContactPage()));
            },
            child: const ListTile(
              leading: Icon(Icons.contacts,),
              title: Text("Contacts",style: TextStyle(fontSize: 18),),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (
                  context) => EventPage()));
            },
            child: const ListTile(
              leading: Icon(Icons.event),
              title: Text("Events",style: TextStyle(fontSize: 18),),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (
                  context) => const Note()));
            },
            child: const ListTile(
              leading: Icon(Icons.notes,),
              title: Text("Notes",style: TextStyle(fontSize: 18),),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (
                  context) =>const PrivacyPolicy()));
            },
            child: const ListTile(
              leading: Icon(Icons.privacy_tip_outlined,),
              title: Text("Privacy policy",style: TextStyle(fontSize: 18),),
            ),
          ),
          InkWell(
            onTap:  () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (
                  context) =>const FeedbackPage()));
            },
            child: const ListTile(
              leading: Icon(Icons.feedback_outlined,),
              title: Text("Send feedback",style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ),
    );
  }
}