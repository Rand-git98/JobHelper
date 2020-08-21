import 'package:flutter/material.dart';
import 'package:jobhelperass/introductions_screen/splash_screen.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Color(0xff659bdb),
        accentColor: Color(0xffb9d4f8),
        primaryColorDark: Color(0xff1f53ad),
        fontFamily: 'Berlin Sans FB Demi',
          buttonColor: Colors.white,
          buttonTheme: ButtonThemeData(
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
                 side: BorderSide(color: Color(0xffb9d4f8))),

          textTheme: ButtonTextTheme.accent,
          minWidth: 170.0,
          height: 60.0,),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}



class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(

    body: SplashScreen(),
  );
}