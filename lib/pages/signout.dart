import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_store_app/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class signout {
  void userout(BuildContext context)async{
  await FirebaseAuth.instance.signOut();
  Fluttertoast.showToast(msg: "Login Successful");
  // Navigator.pop(context);// pop current page
  // Navigator.pushNamed(context, "/profile");
  }

}