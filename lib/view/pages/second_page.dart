import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.person, color: Colors.red)),
        title: Text("This is an appbar"),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: '3',
          child: Container(
            width: 300,
            height: 300,
            child: Image.asset('assets/photo.jpg'),
          ),
        ),
      ),
    );
  }
}
