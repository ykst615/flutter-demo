import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('动画结构')),
      body: AnimatedBuilder(
        animation: animation,
        child: Image.asset("images/avatar.jpeg"),
        builder: (BuildContext ctx, Widget child) {
          return new Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
