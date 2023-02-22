import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';

class AnimationSuccess extends StatefulWidget {
  AnimationSuccess({Key? key}) : super(key: key);

  @override
  _AnimationSuccessState createState() => _AnimationSuccessState();
}

class _AnimationSuccessState extends State<AnimationSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Animated Check Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: AnimatedCheck(
                progress: _animation,
                size: 50,
                color: Colors.green,
              )),
              TextButton(
                  child: Text("Check"),
                  onPressed: _animationController.forward),
              TextButton(
                  child: Text("Reset"), onPressed: _animationController.reset)
            ],
          ),
        ));
  }
}
