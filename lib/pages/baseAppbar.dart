import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signout.dart';
class BaseAppBar{
  int selectedIndex=0;
  
  void tapedItem(int index) async{
    selectedIndex=index;

    //print(selectedIndex);
  }
dynamic getTopAppBar(String title){
  return AppBar(
        title: Text(title), 
        elevation: null,
        actions: [
          IconButton(
            onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite))
        ],
        backgroundColor: Colors.blue[900],
      );
}

dynamic getTopAppBar2(String title){
  return AppBar(
        title: Text(title), 
        elevation: null,
        // actions: [
        //   IconButton(
        //     onPressed: (){}, icon: const Icon(Icons.search)),
        //   IconButton(onPressed: (){}, icon: const Icon(Icons.favorite))
        // ],
        backgroundColor: Colors.blue[900],
      );
}

dynamic getDrawer(BuildContext context){
  // User _usr = FirebaseAuth.instance.currentUser!;
  // String data="Welcome";
  // // ignore: unnecessary_null_comparison
  // if(_usr!=null){
  //   data=_usr.email!;
  // }else{
  //     data="Welcome";
  // }
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Text(
            "data",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Profile'),
          hoverColor: Colors.blueAccent,
          onTap: () async{
            await Navigator.pushNamed(context, '/decision');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.phone_android),
          title: const Text('Mobiles'),
          hoverColor: Colors.blueAccent,
          onTap: () async{
            await Navigator.pushNamed(context, '/products');
            Navigator.pop(context);
          },
        ),
       ListTile( 
          leading: const Icon(Icons.info),
          title: const Text('About'),
          hoverColor: Colors.blueAccent,
          onTap: () async{
            await Navigator.pushNamed(context, '/about');
            Navigator.pop(context);

          },
        ),
        ListTile(
          leading: const Icon(Icons.add_box),
          title: const Text('Orders'),
          hoverColor: Colors.blueAccent,
          onTap: () {
            Navigator.pop(context);

          },
        ),
        ListTile(
          leading: const Icon(Icons.contact_page),
          title: const Text('Contact Us'),
          hoverColor: Colors.blueAccent,
          onTap: () {
            Navigator.pop(context);

          },
        ),
      ],
    ),
  );
}

dynamic getBottomAppbar(BuildContext context){
  return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 25,),
            label: 'Home',
            
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.login,size: 25,),
            label: 'Log in',
          ),
      ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: (index)async{
          tapedItem(index);
          if(selectedIndex==0)
          {
            
            //await Navigator.pushNamed(context, '/home');
          }
          if(selectedIndex==1)
          {
            
            await Navigator.pushNamed(context, '/decision');

            
          }
        },
      );

  }
dynamic getFloatingButton(BuildContext context){
  return FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () async{
          await Navigator.pushNamed(context, '/cart');
        } ,
        tooltip: 'Your basket',
        child: const Icon(Icons.shopping_cart),
        );
        //FloatingActionButtonLocation.centerDocked
}
}
