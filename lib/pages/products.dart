import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_store_app/pages/product_details.dart';

Future<void> main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Products());
}
class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    //BaseAppBar().getDrawer(context);
    //Firebase.initializeApp();
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      // drawer: BaseAppBar().getDrawer(),
      body: FutureBuilder<QuerySnapshot>(
        future: _productsRef.get(),
      builder: (context, snapshot ){
        if(snapshot.hasError){
                return Scaffold(
                  body:Center(
                    child:Text("Error: ${snapshot.error}"),
                  )
                );
              }
        else
        if(snapshot.connectionState == ConnectionState.done)
        {
            return ListView(
        children: snapshot.data!.docs.map((e){
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image(image: ResizeImage(NetworkImage(e['img1'].toString()),width: 60,height: 92)),
            ListTile(
              //leading: Icon(Icons.arrow_drop_down_circle),
              title: Text(e['model'].toString()),
              subtitle: Text(
                e['brand'].toString(),
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: 
              
              Row(
                children: [
                  Text(e['rom']),
                  Text(e['ram']),
                  Expanded(child:Text(e['processor']))
                  ,
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                RaisedButton.icon(
                  textColor: const Color(0xFFffffff),
                  color: Colors.blue[800],
                  splashColor: Colors.blue[900],
                  onPressed: () {
                    // Perform some action
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Product_details(pid:e.id),
                      ));
                  },
                  label: const Text("view more"),
                  icon: const Icon(Icons.arrow_forward_ios, size: 18),

                ),

              ]
            ),
          ],
        ),
      );
        }).toList(),
      );
          }else{
            return const Center(
                    child:CircularProgressIndicator(),
                  );
          }
          },
      ),
      
            floatingActionButton: BaseAppBar().getFloatingButton(context),
    );
  }
}