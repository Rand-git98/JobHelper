import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobhelperass/main_screen/mainScreen.dart';

import '../register_screens/SignUp.dart';

class intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<intro> {

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();

  }

  startTimer() async {
    var duration = Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) =>MainScreen()));
  }
  initScreen(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),


              child: Image.asset("assets/images/main_logo.png"),

            )  ,

            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).textScaleFactor*30),

              child:Text("Welcome in JobHelper \n it is a job search solution"
                  " application that help you to find jobs from all the available job "
                " providers (github,search.gov...)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: displayWidth(context) * 0.04,
                    color: Theme.of(context).primaryColorDark),
              ),

                ),


          ],
        ),
      ),
    );
  }
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }



}