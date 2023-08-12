import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:major_project/res/color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            backgroundColor: AppColors.appbarColor,
            title: const Text('Contacts',style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            foregroundColor: Colors.black
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: FutureBuilder(
                  future: getContacts(),
                  builder: (context,AsyncSnapshot snapshot){
                    if(snapshot.data == null) {
                      return const Center(
                        child: SizedBox(
                            height: 50,
                            child: CircularProgressIndicator()),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index) {
                          Contact contact = snapshot.data[index];
                          return Column(
                            children:[
                              ListTile(
                                leading: const CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.person),
                                ),
                                title: Text(contact.displayName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contact.phones[0]),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.phone),
                                  onPressed: () => _makePhoneCall(contact.phones[0]),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        });
                  }
              ),
            ),
          ],
        )
    );
  }
  Future<List<Contact>> getContacts() async{
    bool isGranted = await Permission.contacts.status.isGranted;
    if(!isGranted){
      isGranted = await Permission.contacts.request().isGranted;
    }
    if(isGranted) {
      return await FastContacts.allContacts;
    }
    return [];
  }
  _makePhoneCall(String phoneNumber) async {
    String phone = 'tel:$phoneNumber';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not make a phone call';
    }
  }
}