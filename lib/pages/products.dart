import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Products());
}
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // dynamic data;
  
  // CollectionReference collectionReference = FirebaseFirestore.instance.collection('products');
  // Future<void> fetchData() async
  // {
  //   Firebase.initializeApp();
  //   QuerySnapshot querySnapshot = await collectionReference.get();
  //   setState(() {
  //    data=querySnapshot.docs.map((e) => e.data()).toList();
  //   });
  //   print(data);
  // }
  @override
  Widget build(BuildContext context) {
    BaseAppBar().getDrawer(context);
     Firebase.initializeApp();
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      // drawer: BaseAppBar().getDrawer(),
      body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
              .collection('products')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
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
                    OutlineButton.icon(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      label: const Text("View more"),
                      icon: const Icon(Icons.arrow_forward_ios, size: 18),

                    ),

                  ]
                ),
              ],
            ),
          );
        }).toList(),
      );
          },
          ) ,
      ),
      
            floatingActionButton: BaseAppBar().getFloatingButton(context),
    );
  }
}