import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/about.dart';
import 'package:mobile_store_app/pages/decision_tree.dart';
import 'package:mobile_store_app/pages/home.dart';
import 'package:mobile_store_app/pages/cart.dart';
import 'package:mobile_store_app/pages/login.dart';
// import 'package:mobile_store_app/pages/product_details.dart';
import 'package:mobile_store_app/pages/products.dart';
import 'package:mobile_store_app/pages/profile.dart';
import 'package:mobile_store_app/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Landing(),
    initialRoute: '/splash',
    routes: {
      '/home':(context)=>Home(),
      '/cart':(context)=>Cart(),
      '/profile':(context)=>Profile(onSignOut: (User) { },),
      '/products':(context)=>Products(),
      '/splash':(context)=>const Splashscreen(),
      '/login':(context)=>Login(onSigninEm: (User) {  },),
      '/decision':(context)=>decisionTree(),
      '/about':(context)=>AboutPage(),
      //'/productDetails':(context)=>Product_details()
    },
  );
  }
}

class Landing extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();
  Landing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initilization,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return Home();
        }
        if(snapshot.hasError){
          return const Scaffold(
            body:Center(child: Text("error"),)
          );
        }
        
        return const Scaffold(
            body:Center(child: Text("Initilizing")));
      }
    );
  }
}