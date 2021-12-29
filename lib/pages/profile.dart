import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_store_app/pages/home.dart';
class Profile extends StatelessWidget {
  final Function(User) onSignOut;
  Profile({required this.onSignOut});

  Future<void> logout(BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logout Successful");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    // ignore: null_check_always_fails
    onSignOut(null!);

  }
  @override
  Widget build(BuildContext context) {
    User _usr = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("Profile"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(_usr.uid),
          ),

          Container(
            child: MaterialButton(
              onPressed: (){
                logout(context);
              },
              child: Text("LOG OUT"),
              color: Colors.red,
              textColor: Colors.white,
              ),
          ),
        ],
      )
      
      
    );
  }
}