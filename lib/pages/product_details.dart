//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
class Product_details extends StatefulWidget {
  final String pid;
  Product_details({
    required this.pid
  });
  @override
  _Product_detailsState createState() => _Product_detailsState();
}
class _Product_detailsState extends State<Product_details> {
  final CollectionReference _productRef = FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar(" "),
      floatingActionButton: BaseAppBar().getFloatingButton(context),

      body: Stack(
        children: [
          FutureBuilder(
            future: _productRef.doc(widget.pid).get(),
            builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
                if(snapshot.hasError){
                return Scaffold(
                  body:Center(
                    child:Text("Error: ${snapshot.error}"),
                  )
                );
              }
              if(snapshot.connectionState == ConnectionState.done){
                DocumentSnapshot<Object?> docData = snapshot.data!;
                return ListView(
                  children: [
                    Container(
                      height: 250,
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: Image.network("${docData['img1']}"),
                      ),
                      Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        "${docData['brand']} ${docData['model']}  \(${docData['color']}, ${docData['ram']}\)",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "\u{20B9} ${docData['price']}",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 40.0,
                      ),
                      child: RaisedButton.icon(
                        onPressed: (){}, 
                        icon: const Icon(Icons.shopping_bag, color: Colors.white,size: 18,), 
                        label: const Text("ADD TO CART", style: TextStyle(color: Colors.white),),
                        color: Colors.blue[800],
                        
                        )
                    ),
                  ]
                );
              }
              return const Center(
                    child:CircularProgressIndicator(),
                  );
            },
          )

        ],
      ),   
    );
  }
}