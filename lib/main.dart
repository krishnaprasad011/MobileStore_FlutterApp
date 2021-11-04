import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/home.dart';
import 'package:mobile_store_app/pages/cart.dart';
import 'package:mobile_store_app/pages/profile.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home':(context)=>Home(),
      '/cart':(context)=>Cart(),
      '/profile':(context)=>Profile(),

    },
  ),
  );
}