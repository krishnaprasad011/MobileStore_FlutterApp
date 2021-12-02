import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/home.dart';
import 'package:mobile_store_app/pages/cart.dart';
import 'package:mobile_store_app/pages/products.dart';
import 'package:mobile_store_app/pages/profile.dart';
import 'package:mobile_store_app/pages/signup.dart';
import 'package:mobile_store_app/pages/splash.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/home':(context)=>Home(),
      '/cart':(context)=>Cart(),
      '/profile':(context)=>Profile(),
      '/products':(context)=>Products(),
      '/signup':(context)=>Signup(),
      '/splash':(context)=>Splashscreen()
    },
  ),
  );
}