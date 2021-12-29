import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_store_app/pages/signout.dart';
class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      drawer: BaseAppBar().getDrawer(context),
      body: Container(
        
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      floatingActionButton: BaseAppBar().getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}