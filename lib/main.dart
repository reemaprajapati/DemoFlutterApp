import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            children: <Widget>[
              new Container(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      'https://appliv-domestic.akamaized.net/v1/240x240/r/icon/440279995/c1f029155427e3ed070b984573fffec2.png'),
                  //                  backgroundColor: Colors.black87,
                ),
                height: 200.0,
                width: 200.0,
                padding: const EdgeInsets.all(15.0),
              ),
              new Text('abcde',
                style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.black87
                ),)
            ],
          ))
        ]
        ,
      )
      ,
    );
//
//    Column buildDetail(String label, String answer, IconData icon) {
//      return new Column(
//        mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Row(
//            children: <Widget>[
//              new Expanded(child: new Column(
//                children: <Widget>[
//                  new Row(children: <Widget>[
//                    new Container(
//                        padding: const EdgeInsets.all(10.0),
//                        child: new Text(label,
//                          style: new TextStyle(
//                              color: Colors.deepOrangeAccent,
//                              fontSize: 30.0
//                          ),)
//                    ),
//                    new Container(
//                      padding: const EdgeInsets.all(10.0),
//                      child: new Text(answer,
//                        style: new TextStyle(
//                            color: Colors.deepOrangeAccent,
//                            fontSize: 30.0
//                        ),),
//                    )
//                  ],)
//                ],
//
//              )),
//              new Container(
//                padding: const EdgeInsets.all(20.0),
//                child: new Icon(icon,size: 50.0,color: Colors.brown,),
//              )
//            ],
//          )
//        ],
//      );
//    }

    void _call(String number) {
      launch("tel://" + "21213123123");
    }

    void _mail(String email) {
      launch("mailto:" + email + "?subject=Hello&body=New%20plugin");
    }

    Widget contactDetails(String position, String address1, String address2,
        String phone, String email) {
      return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
              children: <Widget>[
                new Expanded(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//                    buildDetail('Contact No.', '1234567890',Icons.contact_phone),
//                    buildDetail('Email', 'test@test.com',Icons.email),
//                    buildDetail('Blood Group', 'A+ve', Icons.local_hospital),
//                    buildDetail('Address', 'Kathmandu', Icons.zoom_out_map)
                      new ListTile(
                        title: new Text(position,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
                        leading: new Icon(
                            Icons.work, color: Colors.blue[500]),
                      ),

                      new Divider(),
                      new ListTile(
                        title: new Text(address1,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
                        subtitle: new Text(address2),
                        leading: new Icon(
                          Icons.restaurant_menu,
                          color: Colors.blue[500],
                        ),
                      ),
                      new ListTile(
                        onTap: () => _call(phone),
                        title: new Text(phone,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
                        leading:
                        new Icon(
                            Icons.contact_phone, color: Colors.blue[500]),
//                          onPressed: () => _call(phone),

                      ),
                      new ListTile(
                        onTap: () => _mail(email),
                        title: new Text(email,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)
                        ),
                        leading:
                        new Icon(
                            Icons.contact_mail,
                            color: Colors.blue[500]),
                      ),
                    ]
                )
                ),
              ]
          )

      );
    }

    return new Scaffold (appBar: new AppBar (
      title: new Text (
          widget.title
      ),
    ),
        body:
        new ListView(
          children: <Widget>
          [titleSection,
            contactDetails(
                'Software Developer', 'Kathmandu', 'Nepal', '1234567890',
                'abcd@abcd.com')
          ]
          ,
        )
    );
  }

}
