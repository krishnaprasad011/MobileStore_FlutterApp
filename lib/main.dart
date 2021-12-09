import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/about.dart';
import 'package:mobile_store_app/pages/home.dart';
import 'package:mobile_store_app/pages/cart.dart';
import 'package:mobile_store_app/pages/login.dart';
// import 'package:mobile_store_app/pages/product_details.dart';
import 'package:mobile_store_app/pages/products.dart';
import 'package:mobile_store_app/pages/profile.dart';
import 'package:mobile_store_app/pages/signup.dart';
import 'package:mobile_store_app/pages/splash.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: Landing(),
    initialRoute: '/splash',
    routes: {
      '/home':(context)=>Home(),
      '/cart':(context)=>Cart(),
      '/profile':(context)=>Profile(),
      '/products':(context)=>Products(),
      '/signup':(context)=>Signup(),
      '/splash':(context)=>Splashscreen(),
      '/login':(context)=>Login(),
      '/about':(context)=>AboutPage(),
      //'/productDetails':(context)=>Product_details()
    },
  ),
  );
}
class Landing extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initilization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Scaffold(
            body:Center(child: Text("error"),)
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return Home();
          
        }
        return const Scaffold(
            body:Center(child: Text("Initilizing")));
      }
    );
  }
}