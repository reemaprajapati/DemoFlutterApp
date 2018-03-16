import 'package:flutter/material.dart';

import 'tabs.dart';

class EventsPage extends StatefulWidget {
  @override
  _MyEventsPage createState() => new _MyEventsPage();

}

class _MyEventsPage extends State<StatefulWidget> {
  Choice _selected=choices[0];
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(8.0),
          height: 280.0,
          child: new Card(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new SizedBox(
                  height: 184.0,
                  child: new Image.asset('images/flower.jpeg',
                    fit: BoxFit.fitWidth,),
                )
                ,
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.all(5.0),
                            child: new Text('This is title',
                                style: new TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0
                                )
                            ),
                          ),
                          new Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0.0),
                            child: new Text('This is subtitle',
                                style: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                        child: new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new PopupMenuButton<Choice>(
                            itemBuilder: (BuildContext context) {
                              return choices.map((Choice choice) {
                                return new PopupMenuItem<Choice>(
                                  value: choice,
                                  child: new Text(choice.title),
                                );
                              }).toList();
                            },
                            onSelected: (Choice choice){
                              setState((){
                                _selected=choice;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )
//


              ],
            ),
          ),
        )
      ],
    );
//    return
// new Card(
//      child: new Container(
//        height: 200.0,
//        child: new Row(
//          children: <Widget>[
//            new Expanded(child: new Column(children: <Widget>[
//              new Text('title'),
//              new Image.asset('images/pic.png',height: 100.0,)
//            ],))
//          ],
//        ),
//      ),
//    );
  }

}