import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              // backgroundColor: Colors.cyanAccent,
              title: Text('Hello World'),
              centerTitle: true),
          body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterLogo(size: 80,),Center(child: FlutterLogo(size: 80,)),FlutterLogo(size: 80,),FlutterLogo(size: 80,),
            ],
          )),
    );
  }
}
