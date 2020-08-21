
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MainDetails extends StatelessWidget {

  final String url;
  MainDetails({Key key, @required this.url}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Color(0xff659bdb),
        accentColor: Color(0xffb9d4f8),
        primaryColorDark: Color(0xff1b4a9a),
        fontFamily: 'Berlin Sans FB Demi',


        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Color(0xff1b4a9a))),

          textTheme: ButtonTextTheme.primary,
          minWidth: 170.0,
          height: 60.0,),


        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Container(
        width: MediaQuery.of(context).size.width/2,
        height:MediaQuery.of(context).size.height ,
        child: WebView(

          initialUrl:url,
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),

//      WebView(
//        initialUrl: url,
//        javascriptMode: JavascriptMode.unrestricted,
//      ),

    );
  }
}
class Details extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Details> {



  @override
  Widget build(BuildContext context) {

//    return Scaffold(
//
//      body: WebView(initialUrl: url,
//        javascriptMode: JavascriptMode.unrestricted,),

//    );
  }
}