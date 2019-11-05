import 'package:flutter/material.dart';

class FirstPage  extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Text('Welcome To First Page',style: TextStyle(fontSize: 22.0,color: Colors.amber),),
      ),
    );
  }
}
