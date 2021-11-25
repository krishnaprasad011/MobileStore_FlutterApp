import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("Sign up"),
      // drawer: BaseAppBar().getDrawer(),
      body: Container(
        child: Center(
          child: OutlinedButton(
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),foregroundColor:MaterialStateProperty.all<Color>(Colors.red) ),
          onPressed: () { },
          child: const Text('Sign-in with Google'),
          ),
        ),
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      floatingActionButton: BaseAppBar().getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}