import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/Job.dart';
import '../providers/Jobs.dart';

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primaryColor: Color(0xff659bdb),
        accentColor: Color(0xffb9d4f8),
        primaryColorDark: Color(0xff1f53ad),
        fontFamily: 'Berlin Sans FB Demi',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => MainPage();


}


class MainPage extends State<Home> {
  String c="";
//
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      children: <Widget>[

        new Expanded(

          child:GithubProvider(),


    ),

    ],
    ), );

  }


  TextSet(){
    setState(() { c=controller.text;
       controller.text;});
  }

  String TextSetSecond(){
    setState(() { c=controller.text; });
    return c ;

  }


 }