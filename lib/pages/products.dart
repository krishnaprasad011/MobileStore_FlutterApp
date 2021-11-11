import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    BaseAppBar().getDrawer(context);
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      // drawer: BaseAppBar().getDrawer(),
      body: Container(
        
      ),
      
            floatingActionButton: BaseAppBar().getFloatingButton(context),
    );
  }
}