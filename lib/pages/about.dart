import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar2("About"),
      backgroundColor: Colors.white,
      body:Container(
        child: Text("About"),
        )
    );
  }
}