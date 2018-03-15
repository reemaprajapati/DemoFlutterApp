import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.contact}) : super(key: key);

  final String title;
  final Contact contact;
  static const String routeName = "/MyHomePage";

  @override
  _MyHomePageState createState() => new _MyHomePageState(contact);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.contact);

  Contact contact;

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
                      contact.image),
                  backgroundColor: Colors.black87,
                ),
                height: 200.0,
                width: 200.0,
                padding: const EdgeInsets.all(15.0),
              ),
              new Text(contact.fullName,
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
      launch("tel://" + number);
    }

    void _mail(String email) {
      launch("mailto:" + email + "?subject=Hello&body=New%20plugin");
    }

    Widget contactDetails(Contact contact) {
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
                        title: new Text(contact.post,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
                        leading: new Icon(
                            Icons.work, color: Colors.blue[500]),
                      ),

                      new Divider(),
                      new ListTile(
                        title: new Text(contact.address,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
//                        subtitle: new Text(address2),
                        leading: new Icon(
                          Icons.restaurant_menu,
                          color: Colors.blue[500],
                        ),
                      ),

                      new ListTile(
                        onTap: () => _call(contact.phone),
                        title: new Text(contact.phone,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)),
                        leading:
                        new Icon(
                            Icons.phone, color: Colors.blue[500]),
//                          onPressed: () => _call(phone),

                      ),
                      new ListTile(
                        onTap: () => _mail(contact.email),
                        title: new Text(contact.email,
                            style: new TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20.0)
                        ),
                        leading:
                        new Icon(
                            Icons.email,
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
            contactDetails(contact)
          ]
          ,
        )
    );
  }
}

