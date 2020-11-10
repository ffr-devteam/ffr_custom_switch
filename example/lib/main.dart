import 'package:flutter/material.dart';
import 'package:ffr_custom_switch/ffr_custom_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FFR Custom Switch DEMO',
      home: MyHomePage(title: 'FFR Custom Switch DEMO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool like = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FFRCustomSwitch(
              value: like,
              onChanged: (newValue) {
                setState(() {
                  like = newValue;
                });
              },
              inactiveColor: Colors.red,
              activeColor: Colors.green,
              lable: 'Do you like this package?',
              thumbColor: Colors.grey),
        ),
      ),
    );
  }
}
