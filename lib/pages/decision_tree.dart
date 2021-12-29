import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_store_app/pages/profile.dart';
class decisionTree extends StatefulWidget {
  @override
  _decisionTreeState createState() => _decisionTreeState();
}

class _decisionTreeState extends State<decisionTree> {
  User? user;
  @override
  void initState(){
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCr){
    setState(() {
      user=userCr;
    });
    //print(user);
  }
  Widget build(BuildContext context) {
    if (user == null){
        return Login(onSigninEm: (userCr)=>onRefresh(userCr),);
    } 
    return Profile(onSignOut: (userCr)=>onRefresh(userCr),);
  }
}