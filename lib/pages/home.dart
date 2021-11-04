import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      drawer: BaseAppBar().getDrawer(),
      body: Container(
        
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      floatingActionButton: BaseAppBar().getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}