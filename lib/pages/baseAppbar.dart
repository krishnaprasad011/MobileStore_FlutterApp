import 'dart:convert';
import 'package:flutter/material.dart';

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

dynamic getDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Text(
            'John K',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          
        ),
        ListTile(
          leading: const Icon(Icons.phone_android),
          title: const Text('Mobiles'),
          hoverColor: Colors.blueAccent,
          onTap: () async{
            await Navigator.pushNamed(context, '/products');
          },
        ),
       ListTile( 
          leading: const Icon(Icons.category),
          title: const Text('Shop by Categories'),
          hoverColor: Colors.blueAccent,
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.add_box),
          title: const Text('Orders'),
          hoverColor: Colors.blueAccent,
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.contact_page),
          title: const Text('Contact Us'),
          hoverColor: Colors.blueAccent,
          onTap: () {},
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
            label: 'Sign up',
          ),
      ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: (index)async{
          tapedItem(index);
          if(selectedIndex==0)
          {
            
            await Navigator.pushNamed(context, '/home');
          }
          if(selectedIndex==1)
          {
            await Navigator.pushNamed(context, '/signup');
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
