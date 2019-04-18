import 'package:flutter/material.dart';

/// 状态管理

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'state',
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('state'),
        ),
        body: new Column(
          children: <Widget>[
            new TapboxA(),
            new TapboxA(),
          ],
        ),
      ),
    );
  }
}

// 自身 管理 自身状态

class TapboxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TapboxA();
}

class _TapboxA extends State<TapboxA>{
  bool _active = false;

  void _handleTap() {
    setState(() => _active = !_active);
  }

  @override
  Widget build(BuildContext context) {
    return  new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// TODO: 父 管理 子状态