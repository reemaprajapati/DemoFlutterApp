import 'package:flutter/material.dart';
import 'contact_view.dart';
import 'contact.dart';
import 'events.dart';

class TabSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
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