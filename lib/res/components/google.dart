import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../color.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
);

class Google extends StatefulWidget {
  const Google({Key? key}) : super(key: key);

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text("Google Sign in",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      )
    );
  }

  Widget _buildWidget(){
    GoogleSignInAccount? user = _currentUser;
    if(user != null){
      return Padding(
          padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
             ListTile(
              leading: GoogleUserCircleAvatar(identity: user,),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            const SizedBox(height: 20,),
            const Text("Signed in Successfully",
            style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: signOut,
                child: const Text("Sign Out")
            )
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("You are not Signed in",
            style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: signIn,
                child: const Text("Sign In")
            )
          ],
        ),
      );
    }
  }

  void signOut(){
    _googleSignIn.disconnect();
  }
  Future<void>signIn()async{
    try{
      await _googleSignIn.signIn();
  }catch(e){
      print("Error signing in $e");
    }
  }

}

