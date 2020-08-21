import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobhelperass/main_screen/mainScreen.dart';

import 'SignUp.dart';


class LogIn extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: MyCustomForm(),

    );
  }

}

class MyCustomForm extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }


}

class MyCustomFormState extends State<MyCustomForm>
{    bool isHidePassword=false;
TextEditingController _userName = new TextEditingController();
TextEditingController _password = new TextEditingController();
@override
Widget build(BuildContext context) {

  return Padding(
    padding: EdgeInsets.only(right: MediaQuery.of(context).size.height/30 ,left:  MediaQuery.of(context).size.height/30),

    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.asset("assets/images/main_logo.png"),

        getUserName(),
        getPassword(),
        logInButton(context),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),

          child:InkWell(

             child: RichText(
               text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: ' Do not have an account ?'),
                    TextSpan(text: 'Sign Up Now', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark)),
                  ],
                ),
              ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) =>SignUp()));

            },

          ),
        )
      ],
    ),
  );
}

Padding logInButton(BuildContext context) {
  return Padding(


    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/12),

    child: RaisedButton(

      splashColor: Theme.of(context).primaryColorDark,
      onPressed: () {
        if (_userName.text.isEmpty) {
          Scaffold.of(context).showSnackBar( SnackBar(content: Text("Please Enter UserName"),));
        }


        else if (_password.text.isEmpty) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Please Enter Password"),));
        }

        else {
          Navigator.push(context, MaterialPageRoute(builder:( context) => MainScreen()));

        }
      },

      child: Text("Log in",style: TextStyle(fontSize: displayWidth(context) * 0.05,
          color: Theme.of(context).primaryColorDark),),

    ),
  );
}

TextFormField getPassword() {
  return TextFormField(
    controller: _password,
    keyboardType: TextInputType.text,
    obscureText:  !isHidePassword,
    decoration: InputDecoration(
      labelText: 'password',
      icon: Icon(Icons.lock),

      suffixIcon: IconButton(
        icon: Icon(
          Icons.remove_red_eye,
          color: isHidePassword ? Theme.of(context).primaryColorDark: Colors.grey,
        ),

        onPressed: () {
          _togglePasswordVisability();
        },

      ),
    ),
  );
}

TextFormField getUserName() {
  return TextFormField(
    controller: _userName,
    style: TextStyle(color: Theme.of(context).primaryColorDark),
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      icon: Icon(Icons.person),
      labelText: 'UserName',

    ),

  );
}


void _togglePasswordVisability()
{
  setState(() {
    isHidePassword=!isHidePassword;
  });
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
