import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:jobhelperass/job_details/detailsURL.dart';



class SearchProvider extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class job
{
  final String jobTitile;
//  final int id;
  final String company;
  final String url;
//  final String thumbnailUrl;

  job({this.jobTitile,this.url,this.company
//    , this.id, this.title, this.url, this.thumbnailUrl
  });


}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> title= [];
  List<String> URL= [];
  List<String> organization= [];
  List<String> postdate= [];
  List<String> location= [];


  Future<void> _incrementCounter() async {
    var url = 'https://data.usajobs.gov/api/search?';
    Map<String, String> header = {
      'User-Agent': 'randalhourani22@gmail.com',
      'Authorization-Key': '2WCxbj13JnfkZaHBU7D6b9MtiIAaEkl2UodUAn8LLuI='
    };

    var response = await http.get(url,headers: header);
    var jsonResponse = convert.jsonDecode(response.body);

    var employees = jsonResponse["SearchResult"];

    var x=employees["SearchResultItems"];

    for( int i=0;i<25;i++)

    {
      job q ;
      var v=x[i]["MatchedObjectDescriptor"];
      q=job(jobTitile: v["PositionTitle"],url: v["PositionURI"],company: v["OrganizationName"]);

      setState(() {
        title.add(v["PositionTitle"]);
        URL.add(v["PositionURI"]);
        organization.add(v["OrganizationName"]);
        postdate.add(v["PublicationStartDate"]);
        location.add(v["PositionLocationDisplay"]);
      });





    }
    print(title);


  }

  @override
  Widget build(BuildContext context) {
    _incrementCounter();
    return Scaffold(

      body: Center(

        child:ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext context, int index)

          {
            return Container(
              child: Card(

                  margin: EdgeInsets.all(6.0),
                  elevation: 5,
                  borderOnForeground: true,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child:  ListTile(
                      leading: ClipRRect(

                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          "assets/images/job.png",
                          height: 50.0,
                          width: 50.0,),
                      ),


                      title: Text(title[index],  textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Berlin Sans FB Demi'),

                      ),

                      subtitle:Column(
                        children: <Widget>[
                          Text
                            (organization[index]+"--"+location[index], textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                            ),),

                          Text
                            (postdate[index], textAlign: TextAlign.end,
                            style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                            ),),


                        ],
//
                      ),

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainDetails(url:URL[index] ,),
                            )
                        );
                      },),

                  )


              ) ,
            );

          },
        ),
      ),

    );
  }
}

