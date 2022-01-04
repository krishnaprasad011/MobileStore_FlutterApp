import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar2("About"),
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
                        child: Image.asset(
                          "lib/images/splash.png",
                          fit: BoxFit.contain,
                        )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text("About Mobile Cafe",
            style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),

            ),
          ),
          Container(
                    padding: EdgeInsets.fromLTRB(8, 10, 8, 5),

                    child:Text(
                      " Mobile Cafe is a E-Commerce based Mobile Application Developed using Flutter a cross-platform Application Development Framework."
                      "Our Application provides the customer to buy Smartphones and securely login. We have used Google's Firebase has our back-end database and authentication."
                      " Currently our application only supports cash-on delivary."
                    ,style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                    ),
                    textAlign: TextAlign.justify,
                    
                    ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text("Developers",
            style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),

            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text("K E KRISHNAPRASAD (Back-end Developer)",
            style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                    ),

            ),
          ),
            Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text("NANDAN S (Front-end Developer)",
            style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                    ),

            ),
          ),
        ],
      ),
    );
  }
}