import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List list = ["ahmad", "samir", "yaseer", "tareq"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            FutureBuilder(
              future: newsapi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Container(
                        child: Center(child: Text(snapshot.data.toString())),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              transform: GradientRotation(30),
                              colors: [Colors.blue, Colors.lightGreenAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                          ),
                        ),
                        width: 300,
                        height: 300),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else
                  return Center(child: Text("There is an Error in data"));
              },
            )
          ],
        ),
      ),
    );
  }
}

var token;

newsapi() async {
  Dio getdata = Dio();

  Response response = await getdata.get(
      'https://newsapi.org/v2/everything?q=tesla&from=2023-04-26&sortBy=publishedAt&apiKey=d3e93a2e25df49e4aaea1b30c320d0a6');

  return response;
}


// ListView.separated(itemBuilder: (context, index) => Container(
//                       child: Center(child: Text(list[index])),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             transform: GradientRotation(30),
//                             colors: [Colors.blue, Colors.lightGreenAccent],
//                             begin: Alignment.topLeft,
//                             end: Alignment.topRight),
//                         borderRadius: BorderRadius.horizontal(
//                           left: Radius.circular(20),
//                         ),
//                       ),
//                       width: 300,
//                       height: 300), separatorBuilder: (context, index) => Divider(), itemCount: list.length)

