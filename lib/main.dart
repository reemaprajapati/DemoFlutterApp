import 'package:flutter/material.dart';
import 'profile.dart';
import 'contact_view.dart';
import 'tabs.dart';
void main() => runApp(new TabSamplePage());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var routes=<String,WidgetBuilder>{
//      MyHomePage.routeName : (BuildContext context) => new MyHomePage(title: "Profile",)
    };
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
//      new MyHomePage(title: 'Profile'),
//    new ContactPage(),
//      routes: routes,
    new TabSamplePage()
    );
  }
}
