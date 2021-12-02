import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    super.initState();
    Timer (const Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())));
  }
  Widget build(BuildContext context) {
    var colors2 = const [Color(0xFF400E17), Color(0xFF0F0F5B),];
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: colors2
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('lib/images/splash.png',
            height: 300.0,
            width: 400.0,),
            
          ],
        ),
      ),
      
    );
  }
}