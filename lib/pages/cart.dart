import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:mobile_store_app/pages/home.dart';
import 'package:mobile_store_app/pages/product_details.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final CollectionReference _productRef = FirebaseFirestore.instance.collection("products");
  final CollectionReference _userRef = FirebaseFirestore.instance.collection("users");
  int total=0;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> _refresh() async {
    setState(() {
      
    });
    }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("My Cart"),
      // drawer: BaseAppBar().getDrawer(),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _userRef.doc(userId)
                  .collection("cart").get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 12.0,
                    ),
                    children: snapshot.data!.docs.map((document) {
                    total=0;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Product_details(pid: document.id,),
                          ));
                        },
                        child: FutureBuilder<DocumentSnapshot>(
                          future: _productRef.doc(document.id).get(),
                          builder: (context, productSnap) {
                            if(productSnap.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("${productSnap.error}"),
                                ),
                              );
                            }

                            if(productSnap.connectionState == ConnectionState.done) {
                               DocumentSnapshot<Object?> _productMap = productSnap.data!;
                                total = total + int.parse(_productMap['price'].toString());
                              
                                //print(total);
                              return SizedBox(
                                
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    //vertical: 16.0,
                                    horizontal: 24.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 120,
                                        child: Image(image: ResizeImage(NetworkImage("${_productMap['img1']}"),width: 60,height: 92)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 16.0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_productMap['model']}",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            Text(
                                              "${_productMap['brand']}",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                vertical: 4.0,
                                              ),
                                              child: Text(
                                                "\u{20B9} ${_productMap['price']}",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                            ),
                                            // Text(
                                            //   "Size - ${document.data()['size']}",
                                            //   style: TextStyle(
                                            //       fontSize: 16.0,
                                            //       color: Colors.black,
                                            //       fontWeight:
                                            //       FontWeight.w600),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            }
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
              child: Positioned(
                child: Align(
                    alignment: const FractionalOffset(1.0, 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total",
                              style: TextStyle(
                              fontSize: 20.0,
                               color: Colors.black,
                               fontWeight:FontWeight.w600),
                            ),
                              Text("\u{20B9} ${total.toString()}",
                              style: TextStyle(
                              fontSize: 20.0,
                               color: Colors.red,
                               fontWeight:FontWeight.w600),
                            ),
                            
                              ElevatedButton.icon(
                                
                                onPressed: ()=>showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Your Order Complete'),
          //content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ), 
                                icon: Icon(Icons.check_box), 
                                label: Text("CHECK OUT"),
                                
                            ),
                            // MaterialButton(
                            //   onPressed: (){},
                            //   color: Colors.blue[800],
                            //   textColor: Colors.white,
                            //   child: Text("CHECK OUT "),
                              
                            // ),
                      ],
                    ),
                  ),
                ),
            ),
          ],


        ),
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      //floatingActionButton: BaseAppBar().getFloatingButton(context),
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

}


                                        //   Text(
                                        //   total,
                                        //   style: TextStyle(
                                        //       fontSize: 18.0,
                                        //       color: Colors.black,
                                        //       fontWeight:
                                        //       FontWeight.w600),
                                        // ),