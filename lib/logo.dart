import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'tabs.dart';

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Colors.white),
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: new Image.asset(
            'images/ic_launcher.png'));
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: new Center(
          child: new AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return new Container(
                    height: animation.value,
                    width: animation.value,
                    child: child);
              },
              child: child),
        )
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  _LogoAppState();

  Animation animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(

        duration: const Duration(milliseconds: 3000), vsync: this);
    final CurvedAnimation curve =
    new CurvedAnimation(parent: controller, curve: Curves.bounceOut);

//    final PositionedTransition positionedTransition=
//    new PositionedTransition(rect: , child: )
    animation = new Tween(begin: 0.0, end: 1000.0).animate(curve)
      ..addStatusListener(navigate);

    controller.forward();
  }

  void navigate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      print('context: ${context.widget}');
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => new TabSamplePage()));
    }
  }


  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('context: build ${context.widget} \n ${context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>())}');
    return new GrowTransition(
        child: new LogoWidget(), animation: animation);
  }
}
