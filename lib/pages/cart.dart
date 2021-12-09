import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("Cart"),
      // drawer: BaseAppBar().getDrawer(),
      body: Container(
        
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      //floatingActionButton: BaseAppBar().getFloatingButton(context),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}