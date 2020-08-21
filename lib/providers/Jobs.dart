import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../job_details/detailsURL.dart';

//void main() => runApp(new MaterialApp(
//  home: new HomePage(),
//  debugShowCheckedModeBanner: false,
//));



class GithubProvider extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<GithubProvider> {

  TextEditingController controller = new TextEditingController();



  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =  await client.get('https://jobs.github.com/positions.json');

    final parsed = jsonDecode(response.body);
    setState(() {
      for (Map user in parsed) {
        _userDetails.add(Photo.fromJson(user));
      }
    });
  }


  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(Photo.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    fetchPhotos(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Column(
        children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                    onSearchTextChanged(controller.text);
                  },),
                ),
              ),
            ),
          ),
          new Expanded(

            child: _searchResult.length != 0
                ? new ListView.builder(

              itemCount: _searchResult.length,
              itemBuilder: (context, i) {
                return new Container(
                  child:  Card(
                    margin: EdgeInsets.all(6.0),
                    elevation: 5,
                    borderOnForeground: true,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Padding(
                      padding: EdgeInsets.all(0),
                      child:ListTile(
                      leading: ClipRRect(

                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          "assets/images/job.png",
                          height: 50.0,
                          width: 50.0,),
                      ),

                      title: Text(
                        _searchResult[i].jobTitile, textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Berlin Sans FB Demi'),

                      ),
                      subtitle:Column(
                        children: <Widget>[
                          Text
                            (_searchResult[i].company+"--"+_searchResult[i].location, textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                            ),),

                          Text
                            (_searchResult[i].date, textAlign: TextAlign.end,
                            style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                            ),),

                        ],
//
                      ),


                      onTap: () {


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainDetails(url:_searchResult[i].url ,),
                            )
                        );

                      },
                    )
                      ,),



                  ),

                ) ;


              },
            )
                : new ListView.builder(
              itemCount: _userDetails.length,
              itemBuilder: (context, index) {
                return new Card(
                  margin: EdgeInsets.all(6.0),
                  elevation: 5,
                  borderOnForeground: true,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: new
                    ListTile(
                    leading: ClipRRect(

                    borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                "assets/images/job.png",
                height: 50.0,
                width: 50.0,),
                ),

                title: Text(
                  _userDetails[index].jobTitile, textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Berlin Sans FB Demi'),

                ),
                subtitle:Column(
                children: <Widget>[
                Text
                (_userDetails[index].company+"--"+_userDetails[index].location, textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                ),),

                Text
                (_userDetails[index].date, textAlign: TextAlign.end,
                style: TextStyle(fontFamily: 'Berlin Sans FB Demi'

                ),),

                ],
//
                ),


                onTap: () {


                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => MainDetails(url:_userDetails[index].url ,),
                )
                );

                },
                ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(positionA) async {
    _searchResult.clear();
    if (positionA.isEmpty || positionA=="Github") {
      setState(() {
        positionA;
      });
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.jobTitile.contains(positionA))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }


  TextSet( String a){
    setState(() { a; });
//    print(c);
    return  ;

  }



}

List<Photo> _searchResult = [];

List<Photo> _userDetails = [];

final String url = 'https://jobs.github.com/positions.json';
class Photo {
  final String jobTitile;

  final String company;
  final String url;
  final String location;
  final String date;


  Photo({this.jobTitile, this.company, this.location, this.url, this.date
  });



  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      jobTitile: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      url: json['url'] as String,
      date: json['created_at'] as String,
    );
  }


}
