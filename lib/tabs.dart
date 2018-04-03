import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_view.dart';
import 'events.dart';
import 'profile.dart';

class TabSamplePage extends StatefulWidget {
  TabSamplePage({Key key}):super(key:key);
  static const String routeName = "/TabSamplePage";

  @override
  _NewTabPage createState() => new _NewTabPage();
}

class _NewTabPage extends State<TabSamplePage>{

  @override
  Widget build(BuildContext context) {
    Container container = new Container(
      child: new Column(
        children: <Widget>[
          new Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              new Image.asset('images/flower.jpeg'),
              new Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Reema',
                      style: new TextStyle(
                          color: Colors.white, fontSize: 20.0),),
                    new Text('reem@gmail.com',
                      style: new TextStyle(
                          color: Colors.white, fontSize: 15.0
                      ),)
                  ],
                ),
              )
            ],
          )
//          new Image.asset('images/flower.jpeg'),
//          new Text('reema')
        ],
      ),
    )     ;

    Drawer drawer = new Drawer(
      child: new ListView(
        children: <Widget>[
          container,
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new FlatButton(
              child: new Text('Log in',textDirection: TextDirection.ltr,),
              onPressed: () =>
                  Navigator.push(context, new MaterialPageRoute(builder: (_) =>
                  new MyHomePage(title: 'Profile', contact:
                  contacts[0],))),
            ),),
          new Divider(),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text('Item 2'),
          )
        ],
      ),
    );
    return new MaterialApp(
      home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
              drawer: drawer,
              appBar: new AppBar(
                title: const Text('Yipl'),
                bottom: new TabBar(
                    isScrollable: true,
                    tabs: choices.map((Choice choice) {
                      return new Tab(
                        text: choice.title,
                      );
                    }).toList()
                ),
              ),
              body: new TabBarView(
                children: <Widget>[
                  new EventsPage(),
                  new ContactList(contacts)
                ],
              )
          )),

    );
  }

}

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Events'),
  const Choice(title: 'Contacts')
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}