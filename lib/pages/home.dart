import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_store_app/pages/signout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("products");

  final List<String> imageList=[
    "https://img.global.news.samsung.com/ca/wp-content/uploads/2021/01/thumbnail_image.png",
      "https://cache.tradeinn.com/images/brand-page/banner_2947_16.jpg",
      "https://www.annualreports.com/HostedData/CompanyLogos/NASDAQ_AAPL.png",
      "https://www.spark.co.nz/content/dam/telecomcms/responsive/images/shop/apple/iphone-12-pro/buy-now/buy-now-consumer/iphone12-buy-now-banner-mobile.jpg"

  ];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      drawer: BaseAppBar().getDrawer(context),
      body: ListView(
        children: [
          SizedBox(
            //width: 1.0,
            //height:200,
           // width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                 ),
              items: imageList.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(e,height: 300,width: 1.0,fit: BoxFit.fill,),
                    ],
                ),)).toList(),

            ),
          ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Latest Products",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:180,
                      child: Image.network("https://rukminim1.flixcart.com/image/416/416/kjvrdzk0/mobile/d/z/z/samsung-galaxy-s21-sm-g991bzvginu-original-imafzchshyvwdshf.jpeg"),
                    ),
                    Container(
                      height:100,
                      child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        "SAMSUNG Galaxy S21",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                     Text(
                        "\u{20B9} 89999 ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      Text("128GB ROM"),
                      
                      Text("8GB RAM"),
                     
                      Expanded(child:Text("Exynos 2100"))
                  ,
                ],
              ),
                    )
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:180,
                      child: Image.network("https://rukminim1.flixcart.com/image/416/416/kg8avm80/mobile/r/h/z/apple-iphone-12-dummyapplefsn-original-imafwg8dqgncgbcb.jpeg"),
                    ),
                    Container(
                      height:100,
                      child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        "APPLE iPhone 12",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                     Text(
                        "\u{20B9} 95990 ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      Text("128GB ROM"),
                      
                      Text("3GB RAM"),
                     
                      Expanded(child:Text("A14 Bionic Chip"))
                  ,
                ],
              ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: MaterialButton(onPressed: (){
                    Navigator.pushNamed(context, '/products');
                  },
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text("MORE"),
                  ),
                )

           
        ],
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      floatingActionButton: BaseAppBar().getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}