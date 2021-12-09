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
                      child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Flexible(
                            child: Text(
                        "${docData['brand']} ${docData['model']}  \(${docData['color']}, ${docData['ram']}\)",
                        
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                          ),
                          
                        IconButton(
                        icon: const Icon(Icons.favorite_outline_rounded),
                        color: Colors.pink[700],
                        tooltip: 'Save as Wishlist',
                        onPressed: () {
                          
                                },
                            ),
                           
                      ]) 
                      
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
                    //SizedBox(height: 20,),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                        child: Text("Specification",style: TextStyle(fontWeight:FontWeight.w500, fontSize: 20,),),
                        ),
                    Column(
                      children:<Widget>[
                        
                         Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                         child: Table(
                           children: [
                             TableRow(
                               children: [
                                 Text("OS",style: TextStyle(fontSize: 16,),),
                                 Text("${docData['os']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             
                             TableRow(
                               children: [
                                 Text("Processor",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['processor']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             TableRow(
                               children: [
                                 Text("Camera",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['camera']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             TableRow(
                               children: [
                                 Text("RAM ",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['ram']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             TableRow(
                               children: [
                                 Text("ROM ",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['rom']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             TableRow(
                               children: [
                                 Text("Battery ",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['battery']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                             TableRow(
                               children: [
                                 Text("Color ",style: TextStyle(fontSize: 16,)),
                                 Text("${docData['color']}",style: TextStyle(fontSize: 16,)),
                               ]
                             ),
                           ],
                           ),
                         )
                        ]
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