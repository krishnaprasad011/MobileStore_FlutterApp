import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_store_app/pages/home.dart';
class Profile extends StatelessWidget {
  final Function(User) onSignOut;
  Profile({required this.onSignOut});

  Future<void> logout(BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logout Successful");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    // ignore: null_check_always_fails
    onSignOut(null!);

  }


  @override
  Widget build(BuildContext context) {
   User _usr = FirebaseAuth.instance.currentUser!;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
        appBar: BaseAppBar().getTopAppBar2("Profile"),
        backgroundColor: Colors.white,
        body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(_usr.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
                  children: [
                    Container(
                      height: 250,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 4),
                      child: Image.network("https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg"),
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
                        "${data['firstName']} ${data['secondName']}",
                        
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                          ),  
                      ]) 
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "${data['email']}",
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
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "${data['address']}",
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
                      child:  MaterialButton(
                         onPressed: (){
                          logout(context);
                        },
                          child: Text("LOG OUT"),
                      color: Colors.red,
                        textColor: Colors.white,
                      ),),
                    //SizedBox(height: 20,),
                  ]
                );
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
                
            //     Text("Full Name: ${data['firstName']} ${data['secondName']}"),
            //     Text("Email: ${data['email']}"),
            //     MaterialButton(
            //       onPressed: (){
            //     logout(context);
            //   },
            //   child: Text("LOG OUT"),
            //   color: Colors.red,
            //   textColor: Colors.white,
            //   ),

            //   ],
            // );
          }

          return const Text("loading");
          // 
        },
        
      ),
    );
  }
}


// Container(
//             child: MaterialButton(
//               onPressed: (){
//                 logout(context);
//               },
//               child: Text("LOG OUT"),
//               color: Colors.red,
//               textColor: Colors.white,
//               ),
//           ),